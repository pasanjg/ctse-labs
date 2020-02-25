import 'package:flutter/material.dart';
import 'package:treva_shop/pages/app_main.dart';

void main()=>runApp(TrevaShop());

class TrevaShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppMain(),
    );
  }
}

