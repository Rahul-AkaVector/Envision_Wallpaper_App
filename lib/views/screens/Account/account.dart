import 'package:flutter/material.dart';

import '../Navigation Bar/navigationBar.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          color: Colors.green,
        ),
      ),
      bottomNavigationBar: NBar(),
    );
  }
}
