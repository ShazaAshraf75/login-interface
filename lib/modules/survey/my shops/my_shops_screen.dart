import 'package:flutter/material.dart';
import 'package:login_interface/modules/survey/my%20shops/widgets/shop_add_button.dart';

class MyShopsScreen extends StatelessWidget {
  const MyShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shops"),
        actions: [ShopAddButton(onPressed: () {})],
      ),
    );
  }
}
