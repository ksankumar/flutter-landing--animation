import 'package:cricmates/utils/strings.dart';
import 'package:cricmates/utils/styles.dart';
import 'package:cricmates/utils/validator.dart';
import 'package:cricmates/widgets/password_input.dart';
import 'package:cricmates/widgets/text_input.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 30),
      child: Column(
        children: <Widget>[
          InputText(
            controller: usernameController,
            label: Label.email,
            prefixIcon: Icons.people,
            keyboardType: TextInputType.emailAddress,
            validator: FormValidator().validateEmail,
            onSaved: (String value) {},
          ),
          InputPassword(
            // controller: _controllerPassword,
            // focusNode: _passwordFocus,
            label: Label.password,
//                                                  formEnable: loginBloc.currentState is LoginLoading
//                                                      ? false
//                                                      : true,
            validator: FormValidator().validatePassword,
            textInputAction: TextInputAction.done,
            onSaved: (String value) {
              // _password = value;
            },
            onFieldSubmitted: (username) {
              // FocusScope.of(context).requestFocus(_loginButtonFocus);
            },
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              padding: const EdgeInsets.all(16.0),
              color: Colors.pink,
              child: Text(Label.login, style: TextStyles.buttonText),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
            ),
          ),
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
          )
        ],
      ),
    );
  }
}
