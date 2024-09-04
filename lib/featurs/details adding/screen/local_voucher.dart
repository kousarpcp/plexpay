import 'package:flutter/material.dart';

class LocalVoucher extends StatefulWidget {
  const LocalVoucher({super.key});

  @override
  State<LocalVoucher> createState() => _LocalVoucherState();
}

class _LocalVoucherState extends State<LocalVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            )),
        title: Text(
          "Recharge",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }
}
