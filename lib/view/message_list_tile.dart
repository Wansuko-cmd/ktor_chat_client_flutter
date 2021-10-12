import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageListTile extends StatelessWidget{

  final String text;
  final String userName;

  final VoidCallback onTap;
  final VoidCallback onDeletePressed;

  MessageListTile({
    required this.text,
    required this.userName,
    required this.onTap,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      subtitle: Text(userName),
      onTap: onTap,
      trailing: ElevatedButton(
        child: Icon(Icons.delete),
        onPressed: onDeletePressed,
      ),
    );
  }
}