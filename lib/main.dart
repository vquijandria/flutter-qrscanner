import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(const MyApp());


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String qrValue = "Codigo QR";

  void scanQr() async {
    String? cameraScanResult = await scanner.scan();
    setState(() {
      qrValue = cameraScanResult!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp (
      debugShowCheckedModeBanner: false,
      title: 'QR Scan',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'QR Scan',
          ),
        ),
        body: Center(
          child: Container(
            child: Text(
              qrValue,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () => scanQr(),
          child: const Icon(
            Icons.camera,
          ),
        ),
      ),
    );
  }
}