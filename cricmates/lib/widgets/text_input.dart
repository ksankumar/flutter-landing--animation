import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cricmates/utils/screen.dart';
import 'package:cricmates/widgets/circle_icon.dart';

class InputText extends StatefulWidget {
  const InputText({
    Key key,
    this.controller,
    this.focusNode,
    this.helperText,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType = TextInputType.text,
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
  final IconData prefixIcon;
  final IconData suffixIcon;
  final int maxLength;
  final TextInputType keyboardType;
  final bool formEnable;
  final TextInputAction textInputAction;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onFieldSubmitted;

  @override
  TextInputField createState() => new TextInputField();
}

class TextInputField extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: new TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
            helperText: widget.helperText,
            labelText: widget.label,
            prefixIcon: Icon(
                widget.prefixIcon,
                size: ScreenSize.texIconSize
            ),
            suffixIcon: CircleIconButton(
              onPressed: () {
                setState(() {
                  widget.controller.clear();
                });
              },
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
          LengthLimitingTextInputFormatter(widget.maxLength)] : [],
        keyboardType: widget.keyboardType,
        enabled: widget.formEnable,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}