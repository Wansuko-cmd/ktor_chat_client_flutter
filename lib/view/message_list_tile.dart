import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageListTile extends StatelessWidget{

  final String text;
  final String userName;

  final VoidCallback onDeletePressed;

  MessageListTile({
    required this.text,
    required this.userName,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      subtitle: Text(userName),
      trailing: ElevatedButton(
        child: Icon(Icons.delete),
        onPressed: onDeletePressed,
      ),
    );
  }
}