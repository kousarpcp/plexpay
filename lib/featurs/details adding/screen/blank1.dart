import 'package:flutter/material.dart';

class Etisalat extends StatefulWidget {
  const Etisalat({super.key});

  @override
  State<Etisalat> createState() => _EtisalatState();
}

class _EtisalatState extends State<Etisalat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Etisalat"))
        ],
      ),
    );
  }
}
