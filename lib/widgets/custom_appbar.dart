import 'package:flutter/material.dart';
AppBar CustomAppbar(String title, bool centerTitle, {Widget? leading, List<Widget?>? actionIcon}) {
  return AppBar(
    backgroundColor: Color(0xFFFFFFFF),
    title: Text(
      title,
      style: const TextStyle(fontSize: 20, color: Colors.black),
    ),
    centerTitle: centerTitle,
    leading: leading != null ? leading : null,
    actions: actionIcon != null
        ? actionIcon.whereType<Widget>().toList()
        : null,
  );
}
