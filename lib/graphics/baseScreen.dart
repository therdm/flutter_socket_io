import 'package:flutter/material.dart';

class AppBaseScaffold extends StatelessWidget {
  const AppBaseScaffold({
    Key? key,
    required this.body,
    this.centerTitle = true,
    this.title,
  }) : super(key: key);
  final Widget body;
  final String? title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
        centerTitle: centerTitle,
      ),
      body: body,
    );
  }
}
