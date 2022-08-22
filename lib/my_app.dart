import 'package:flutter/material.dart';
import 'package:navigator2_flutter/navigator_controller.dart';
import 'package:navigator2_flutter/shop_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ShopController _shopController;
  late NavigatorController _navigatorController;

  @override
  void initState() {
    _shopController = ShopController();
    _navigatorController = NavigatorController();
    _navigatorController.addListener(() {
      setState(() {});
    });
    _shopController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: List.of(_navigatorController.stack),
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }
}
