import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



typedef TextAlertDialogCallback = void Function(GlobalKey<FormState> formKey, String userName, String text);



class TextAlertDialog extends StatelessWidget{

  final String userName;
  final String text;

  final String? title;
  final String? userNameHintText;
  final String? textHintText;

  final TextAlertDialogCallback? onNegative;
  final TextAlertDialogCallback? onPositive;

  final FormFieldValidator<String>? userNameValidator;
  final FormFieldValidator<String>? textValidator;

  TextAlertDialog({
    this.userName = "",
    this.text = "",

    this.title,
    this.userNameHintText,
    this.textHintText,

    this.onNegative,
    this.onPositive,

    this.userNameValidator,
    this.textValidator,
  });


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final _userNameController = TextEditingController(text: userName);
    final _textController = TextEditingController(text: text);

    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(hintText: userNameHintText),
              autofocus: true,
              validator: userNameValidator,
            ),
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(hintText: textHintText),
              autofocus: true,
              validator: textValidator,
            ),
          ],
        )
      ),
      actions: [
        TextButton(
            child: Text('Cancel'),
            onPressed: () =>
            onNegative != null ? onNegative!(_formKey, _userNameController.text, _textController.text) : null
        ),
        TextButton(
            child: Text('OK'),
            onPressed: () =>
            onPositive != null ? onPositive!(_formKey, _userNameController.text, _textController.text) : null
        )
      ],
    );
  }
}