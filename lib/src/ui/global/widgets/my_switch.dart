import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({
    Key? key,
    this.onChanged,
    this.value,
  }) : super(key: key);

  final void Function(bool value)? onChanged;
  final bool? value;

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return CupertinoSwitch(
      value: widget.value ?? _value,
      onChanged: (bool value) {
        setState(() {
          _value = value;
        });
        widget.onChanged?.call(value);
      },
      activeColor: CupertinoColors.secondarySystemFill,
      thumbColor: themeData.colorScheme.secondary,
    );
  }
}
