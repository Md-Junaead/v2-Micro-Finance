import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/routes/routes.dart';
import 'package:v1_micro_finance/configs/routes/routes_name.dart';

void main() {
  runApp(MicroFinance());
}

class MicroFinance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      // this is the initial route indicating from where our app will start
      initialRoute: RoutesName.signupScreen,
      onGenerateRoute: Routes.generateRoute, // Name of Open screen
    );
  }
}
