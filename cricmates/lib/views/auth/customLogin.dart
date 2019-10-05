import 'package:cricmates/utils/helper/customBackgroundClipper.dart';
import 'package:cricmates/views/auth/form.dart';
import 'package:cricmates/widgets/text_field1.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricmates/blocs/login_bloc.dart';
import 'package:cricmates/widgets/text_input.dart';
import 'package:cricmates/widgets/password_input.dart';
import 'package:cricmates/utils/strings.dart';
import 'package:cricmates/utils/validator.dart';
import 'package:cricmates/utils/styles.dart';

class CustomLogin extends StatefulWidget {
  final String title;
  CustomLogin({Key key, this.title}) : super(key: key);
  @override
  _CustomLoginState createState() => _CustomLoginState();
}

class _CustomLoginState extends State<CustomLogin>
    with TickerProviderStateMixin {
  Animation<double> animationScaleDown;
  Animation<double> animationTextSizeDown;
  Animation<double> animationFadeIn;
  Animation<double> animationFadeInInput;
  Animation<double> animationMoveUp;
  Animation<double> animationRotate;
  AnimationController controller, controller2, controller3, controller4;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  final _scaffoldState = GlobalKey<ScaffoldState>();

  var height = 300.0;
  var width = 300.0;
  var progressDialog;
  bool isProgressDialog = false;

  @override
  void initState() {
    super.initState();
    initData();
    controller.forward();
    controller4.repeat();

    controller.addListener(() {
      setState(() {
        if (animationFadeIn.status == AnimationStatus.completed) {
          controller2.forward();
          new Timer(
              const Duration(milliseconds: 400), () => controller3.forward());
        }
      });
    });

    controller2.addListener(() {
      setState(() {
        if (animationMoveUp.status == AnimationStatus.forward) {
          height = animationScaleDown.value;
          width = height;
          //if (spacing > 0) spacing  --;
        } else if (animationMoveUp.status == AnimationStatus.completed) {}
      });
    });

    controller4.addListener(() {
      setState(() {
        if (animationRotate.status == AnimationStatus.completed) {
          controller4.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    print(usernameController.text);
    if (passController.text.isNotEmpty) {
      getSignIn(usernameController.text, passController.text);
    } else {
      showMyDialog('Please enter number');
    }
  }

  getSignIn(String user, String pass) async {
    print(pass);
    setState(() {
      isProgressDialog = true;
    });
  }

  void showMyDialog(String msg) {
    setState(() {
      isProgressDialog = false;
    });

    var alert = new AlertDialog(
      content: new Stack(
        children: <Widget>[
          new Text(
            'Message',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          new Container(
              margin: new EdgeInsets.only(top: 40.0),
              child: new Text(
                '$msg',
                style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text(
              'OK',
              style: TextStyle(color: const Color(0xFF860000)),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  void initData() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animationFadeIn = new Tween(begin: 0.0, end: 1.0).animate(controller);

    controller2 = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animationMoveUp = new Tween(begin: 0.0, end: -0.8).animate(controller2);
    animationScaleDown =
        new Tween(begin: 300.0, end: 180.0).animate(controller2);
    animationTextSizeDown =
        new Tween(begin: 70.0, end: 40.0).animate(controller2);

    controller3 = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animationFadeInInput = new Tween(begin: 0.0, end: 1.0).animate(controller3);

    controller4 = new AnimationController(
        duration: new Duration(milliseconds: 700), vsync: this);
    animationRotate = new Tween(begin: 0.0, end: 360.0).animate(controller4);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Colors.white,
      body: BlocProvider<LoginBloc>(
        builder: (context) {
          return LoginBloc();
        },
        child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {},
            child:
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  dragStartBehavior: DragStartBehavior.down,
                  child: Container(
                    color: Colors.white,
                    height: mediaQuery.size.height,
                    width: mediaQuery.size.width,
                    child: Column(
                      children: <Widget>[
                        topContainer(),
                        secondContainer(),
                        signupArea(),
                        
                      ],
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }

  Widget secondContainer() {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: Duration(seconds: 1),
      child: formContainer(),
    );
  }

  Widget formContainer() {
    return Container(
      color: Colors.deepPurple[900],
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.transparent),
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(50.0))),
        child: getRestOfWidgets(),
      ),
    );
  }

  Widget bottomContainer() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.deepPurple[900],
            child: SizedBox(height: 100,),
          ),
        )
      ],
    );
  }

  Widget topContainer() {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple,
                  Colors.deepPurple[800],
                  Colors.deepPurple[900]
                ]),
                border: Border.all(width: 0.0, color: Colors.transparent),
            borderRadius: BorderRadius.only(
              
              bottomLeft: Radius.circular(50.0),
            )),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[welcomeText(), imageWrapper()],
        ));
  }

  Widget welcomeText() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          'Welcome,',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'GoogleSans-Medium'),
        ),
      ),
    );
  }

  Widget imageWrapper() {
    return Container(
      // color: Colors.transparent,
      // elevation: 10,
      child: new Opacity(
        opacity: animationFadeIn.value,
        child: new Container(
            margin: EdgeInsets.only(top: 55),
            alignment: Alignment(0.0, animationMoveUp.value),
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Image.asset('assets/img/tiger-logo.png',
                      height: 150, width: 150, fit: BoxFit.fill),
                  alignment: Alignment(0.0, animationMoveUp.value),
                ),
                new Container(
                  child: Text(
                    'CricMate',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'GoogleSans-Medium'),
                  ),
                  alignment: Alignment(0.0, animationMoveUp.value),
                )
              ],
            )),
      ),
    );
  }

 
 

  Widget getRestOfWidgets() {
    return Opacity(
      opacity: animationFadeInInput.value,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                emailTextBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget signupArea() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).padding.bottom > 0
            ? MediaQuery.of(context).padding.bottom
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

  Widget emailTextBox() {
    return SingleChildScrollView(
      
        child: Padding(
      padding: EdgeInsets.only(left: 30.0, top: 50),
      child: FormWidget(),
    ));
  }
}
