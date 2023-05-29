import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../models/constants.dart';

class ConnectBtn extends StatefulWidget {
  const ConnectBtn({super.key});

  @override
  State<ConnectBtn> createState() => _ConnectBtnState();
}

class _ConnectBtnState extends State<ConnectBtn> {
  bool _connected = false;
  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      padding: EdgeInsets.all(kDefaultPadding * 2),
      height: 400,
      width: 400,
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding * 2),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(400)),
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding * 2),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(400)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(400)),
            child: TextButton(
              child: Text(
                "Connect",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _connected == false
                          ? kTextColor
                          : kSecondaryColor.withOpacity(0.4),
                    ),
              ),
              onPressed: () {
                setState(() {
                  _connected = !_connected;
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(300.0)))),
            ),
          ),
        ),
      ),
    );
    return Animate(
      child: widget,
    ).animate(target: _connected ? 1 : 0).shake();
  }
}
