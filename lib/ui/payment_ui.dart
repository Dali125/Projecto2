import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../colors/colors.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.logColor,
            Colors.white70,
          ]),

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment'),

      ),
      body: Column(

        children: [


         ListTile(leading: Checkbox(value: true, onChanged: (bool? value) {  },),)
        ],


      ),
    );
  }
}
