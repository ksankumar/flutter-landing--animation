import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricmates/blocs/login_bloc.dart';
import 'package:cricmates/widgets/text_input.dart';
import 'package:cricmates/widgets/password_input.dart';
import 'package:cricmates/utils/strings.dart';
import 'package:cricmates/utils/validator.dart';
import 'package:cricmates/utils/screen.dart';
import 'package:cricmates/utils/styles.dart';

final _scaffoldState = GlobalKey<ScaffoldState>();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldState,
        backgroundColor: Colors.white,
        body: BlocProvider<LoginBloc>(
          builder: (context) {
            return LoginBloc();
          },
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              _checkStatusLogin(state);
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            children: <Widget>[
                              WidgetAppLogo(),
                              WidgetWelcomeLabel(),
                              WidgetFormLogin(),
                              WidgetResetPasswordButton(),
                            ],
                          ),
                        ),
                        WidgetSignUp(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _checkStatusLogin(LoginState state) async {
    if (state is LoginFailed) {
      _scaffoldState.currentState.showSnackBar(
        SnackBar(content: Text('${state.error}')),
      );
    } else if (state is LoginSuccess) {
      // var localAuth = LocalAuthentication();
      try {
//        bool isAuthenticate = await localAuth.authenticateWithBiometrics(
//            localizedReason: 'Please authenticate to login', stickyAuth: true);
//        print('isAuthenticate: ' + isAuthenticate.toString());
      } on PlatformException catch (e) {
        print(e);
      }
    }
  }
}

class WidgetAppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        top: mediaQuery.padding.top > 0 ? mediaQuery.padding.top : 16.0,
        right: 16.0,
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Hero(
              tag: Strings.appName,
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.only(top: 10.0),
                child: Image(
                    image: AssetImage('assets/img/tiger-logo.png'),
                    height: Constant.defaultImageHeight+20,
                    width: Constant.defaultImageHeight+20,
                    fit: BoxFit.contain
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Center(
              child: Text(
                Strings.appName,
                style: TextStyles.appName,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetWelcomeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.loginTitle,
              style: TextStyles.loginTitle,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              Strings.loginSubTitle,
              style: TextStyles.loginSubTitle,
            ),
          ]
      ),
    );
  }
}

class WidgetFormLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<WidgetFormLogin>
    with TickerProviderStateMixin {

  FocusNode _emailFocus, _passwordFocus, _loginButtonFocus;
  String _email = "";
  String _password = "";

//  bool _screenUtilActive = true;
  final GlobalKey<FormState> _loginState = new GlobalKey();

//  setScreenSize() {
//    if (!_screenUtilActive)
//      Constant.setScreenAwareConstant(context);
//    else
//      Constant.setDefaultSize(context);
//    setState(() {
//      _screenUtilActive = !_screenUtilActive;
//    });
//  }

  final _controllerUsername = TextEditingController();
  final _controllerPassword = TextEditingController();

  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;


  @override
  void initState() {
    print('called');
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    _setData();
    _emailFocus = new FocusNode();
    _passwordFocus = new FocusNode();
    _loginButtonFocus = new FocusNode();
    super.initState();
  }

  void _setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _loginButtonFocus.dispose();
    super.dispose();
  }

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    Constant.setScreenAwareConstant(context);
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return new Form(
      key: _loginState,
      autovalidate: _validate,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0),
        child: Column(
          children: <Widget>[
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: opacity1,
              child: InputText(
                controller: _controllerUsername,
                focusNode: _emailFocus,
                label: Label.email,
                prefixIcon: Icons.people,
                keyboardType: TextInputType.emailAddress,
                formEnable: loginBloc.currentState is LoginLoading
                    ? false
                    : true,
                validator: FormValidator().validateEmail,
                onSaved: (String value) {
                  _email = value;
                },
                onFieldSubmitted: (username) {
                  FocusScope.of(context).requestFocus(_passwordFocus);
                },
              ),
            ),
            SizedBox(height: 12.0),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: opacity2,
              child: InputPassword(
                controller: _controllerPassword,
                focusNode: _passwordFocus,
                label: Label.password,
                formEnable: loginBloc.currentState is LoginLoading
                    ? false
                    : true,
                validator: FormValidator().validatePassword,
                textInputAction: TextInputAction.done,
                onSaved: (String value) {
                  _password = value;
                },
                onFieldSubmitted: (username) {
                  FocusScope.of(context).requestFocus(_loginButtonFocus);
                },
              ),
            ),
            SizedBox(height: 16.0),
            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: opacity3,
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  focusNode: _loginButtonFocus,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.pink,
                  child: Text(Label.login, style: TextStyles.buttonText),
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
//                    String username = _controllerUsername.text;
//                    String password = _controllerPassword.text;
//                    loginBloc.dispatch(
//                      LoginEvent(
//                        username: username,
//                        password: password,
//                      ),
//                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetResetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        children: <Widget>[
          Center(
            child: FlatButton(
              child: Text(
                Label.resetPassword,
                style: TextStyles.linkText,
              ),
              onPressed: () {
                // TODO: do something in here
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: mediaQuery.padding.bottom > 0
            ? mediaQuery.padding.bottom
            : 16.0,
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: Strings.newAccount,
                style: TextStyles.loginSubTitle,
              ),
              TextSpan(
                text: Label.signUp,
                style: TextStyles.linkText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}