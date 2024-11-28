import 'package:finale/core/class/crud.dart';
import 'package:flutter/material.dart';

class HandlingStates extends StatelessWidget {
  final StatusRequest? status;
  final Widget widget;
  const HandlingStates({super.key, required this.status, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case StatusRequest.loading:
        return const Center(child: Text('loading...'));
      case StatusRequest.internetFailed:
        return const Center(child: Text('internet failed...'));
      case StatusRequest.serverFailed:
        return const Center(child: Text('server failed...'));
      case StatusRequest.exceptionFailed:
        return const Center(child: Text('exeption ...'));
      case StatusRequest.failed:
        return const Center(child: Text('no data...'));
      default:
        return widget;
    }
  }
}
