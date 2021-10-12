import 'package:flutter/cupertino.dart';
import 'package:ktor_chat_client_flutter/view/dialog/alert_message.dart';
import 'package:quiver/strings.dart';
import 'package:ktor_chat_client_flutter/view/dialog/message_alert_dialog.dart';

class UpdateAlertDialog extends StatelessWidget {

  final String userName;
  final String text;

  UpdateAlertDialog({
    required this.userName,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextAlertDialog(
      title: "更新",

      userName: userName,
      text: text,

      userNameHintText: "ユーザー名",
      textHintText: "テキスト",

      onNegative: (formKey, userName, text) => Navigator.pop(context),
      onPositive: (formKey, userName, text)
      => formKey.currentState!.validate() ?
      Navigator.pop<AlertMessage>(context, AlertMessage(userName, text)) :
      null,

      userNameValidator: (value) => isBlank(value) ? '入力してください' : null,
      textValidator: (value) => isBlank(value) ? '入力してください' : null,
    );
  }
}