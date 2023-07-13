import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    Key? key,
    required this.status,
  }) : super(key: key);

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      decoration: BoxDecoration(
        color: status ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        status ? 'Lunas' : 'Hutang',
        style: TextStyle(
            color: status ? Colors.green.shade700 : Colors.red.shade600),
      ),
    );
  }
}
