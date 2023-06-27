import 'package:flutter/material.dart';

class DelayPage extends StatefulWidget {
  const DelayPage({super.key});

  @override
  State<DelayPage> createState() => _DelayPageState();
}

class _DelayPageState extends State<DelayPage> {
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    _delayedDisplay();
  }

  void _delayedDisplay() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Image
        _showText
            ? Image.asset(
                'images/canva.png',
                scale: 30,
              )
            : SizedBox(),

        // Text
        Center(
          child: _showText ? Text('Delayed Text') : SizedBox(),
        ),
      ],
    );
  }
}
