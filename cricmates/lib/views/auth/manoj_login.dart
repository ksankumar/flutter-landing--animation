import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cricmates/views/auth/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricmates/blocs/login_bloc.dart';
import 'package:cricmates/utils/strings.dart';
import 'package:cricmates/utils/styles.dart';
import 'package:cricmates/utils/screen.dart';

class ManojLogin extends StatefulWidget {
  ManojLogin({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ManojLoginState createState() => _ManojLoginState();
}

class _ManojLoginState extends State<ManojLogin> with TickerProviderStateMixin {
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
              const Duration(milliseconds: 700), () => controller3.forward());
        }
      });
    });

    controller2.addListener(() {
      setState(() {
        if (animationMoveUp.status == AnimationStatus.forward) {
          height = animationScaleDown.value;
        } else if (animationMoveUp.status == AnimationStatus.completed) {
           height = ScreenSize.imageHeight;
        }
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
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    var mediaQuery = MediaQuery.of(context);
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
              // _checkStatusLogin(state);
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Container(
                  height: mediaQuery.size.height,
                  width: mediaQuery.size.width,
                  child: new Stack(
                    children: <Widget>[
                      Positioned(
                        child: new Opacity(
                          opacity: animationFadeIn.value,
                          child: new Container(
//                            padding: EdgeInsets.only(
//                              left: 16.0,
//                              top: mediaQuery.padding.top > 0
//                                  ? mediaQuery.padding.top
//                                  : 16.0,
//                              right: 16.0,
//                            ),
                            alignment: Alignment(0.0, animationMoveUp.value),
                            child: new Wrap(
                              children: <Widget>[
                                new Container(
                                  alignment:
                                      Alignment(0.0, animationMoveUp.value),
                                  child: new Image.asset(
                                    'assets/img/tiger-logo.png',
                                    width: height,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                new Container(
                                  alignment: Alignment(0.0, animationMoveUp.value * 2.9),
                                  child: Text(
                                    'CricMate',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: animationTextSizeDown.value / 1.5,
                                      fontFamily: 'Pacifico-Regular',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: mediaQuery.size.height / 3.3,
                        left: 16,
                        right: 16,
                        child: Opacity(
                          opacity: animationFadeInInput.value,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: mediaQuery.size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FormWidget(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        alignment: Alignment(0.0, 1.0),
                                        height: 25,
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: Strings.newAccount,
                                                  style:
                                                      TextStyles.loginSubTitle,
                                                ),
                                                TextSpan(
                                                  text: Label.signUp,
                                                  style: TextStyles.linkText,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void initData() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animationFadeIn = new Tween(begin: 0.0, end: 1.0).animate(controller);

    controller2 = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animationMoveUp = new Tween(begin: 0.0, end: -0.95).animate(controller2);
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
}
