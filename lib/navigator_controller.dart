import 'package:flutter/material.dart';
import 'package:navigator2_flutter/pages/details.page.dart';
import 'package:navigator2_flutter/pages/shopping.page.dart';

import 'pages/cart.page.dart';

class NavigatorController extends ChangeNotifier {
  List<MaterialPage> stack;

  NavigatorController._internal()
      : stack = [const MaterialPage(child: ShoppingPage())];
  static final NavigatorController _navigatorController =
      NavigatorController._internal();
  factory NavigatorController() {
    return _navigatorController;
  }

  void addDetailsPage() {
    stack.add(const MaterialPage(child: DetailsPage()));
    notifyListeners();
  }

  void removeDetailsPage() {
    stack.removeWhere((page) => page.child is DetailsPage);
    notifyListeners();
  }

  void addCartPage() {
    stack.add(const MaterialPage(child: CartPage()));
    notifyListeners();
  }

  void removeCartPage() {
    stack.removeWhere((page) => page.child is CartPage);
    notifyListeners();
  }
}
