import 'package:flutter/material.dart';

class RestartApp extends StatefulWidget {
  const RestartApp({Key? key, required child})
      : _child = child,
        super(key: key);

  final Widget _child;

  static void rebuild(BuildContext context) {
    context.findAncestorStateOfType<_RestartAppState>()?.restartApp();
  }

  @override
  _RestartAppState createState() => _RestartAppState();
}

class _RestartAppState extends State<RestartApp> {
  Key _key = UniqueKey();

  void restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: _key, child: widget._child);
  }
}
