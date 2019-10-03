import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cricmates/utils/screen.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    Key key,
    this.controller,
    this.focusNode,
    this.helperText,
    this.label,
    this.maxLength,
    this.formEnable = true,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String helperText;
  final String label;
  final int maxLength;
  final bool formEnable;
  final TextInputAction textInputAction;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onFieldSubmitted;

  @override
  PasswordInputField createState() => new PasswordInputField();
}

class PasswordInputField extends State<InputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: new TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: _obscureText,
        decoration: InputDecoration(
            helperText: widget.helperText,
            labelText: widget.label,
            prefixIcon: Icon(
                Icons.lock,
                size: ScreenSize.texIconSize
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off),
            ),
            errorMaxLines: 2,
            contentPadding: EdgeInsets.all(16.0),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            )
        ),
        inputFormatters: (widget.maxLength != null) ? [
          LengthLimitingTextInputFormatter(widget.maxLength),
          WhitelistingTextInputFormatter(RegExp("[0-9]"))
        ] : [],
        keyboardType: TextInputType.text,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}