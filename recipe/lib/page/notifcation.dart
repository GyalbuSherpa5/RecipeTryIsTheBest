import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notification')),
        body: const Center(
          child: Text(
            'Notification screen',
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
