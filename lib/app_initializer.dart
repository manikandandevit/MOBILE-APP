import 'package:bright_kid/view/data/utils.dart';
import 'package:flutter/material.dart';

class AppInitializer extends StatefulWidget {
  final Widget child;

  const AppInitializer({required this.child});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ✅ This runs when MediaQuery is READY
    initResponsiveValues(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}