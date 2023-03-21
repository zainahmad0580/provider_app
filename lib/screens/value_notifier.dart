import 'package:flutter/material.dart';

class ValueNotifierScreen extends StatelessWidget {
  ValueNotifierScreen({super.key});

  final ValueNotifier<bool> _hide = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    print('Inside build');
    return Scaffold(
      appBar: AppBar(
          title: const Text('Change with value notifier'), centerTitle: true),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: _hide,
        builder: (context, value, child) {
          print('Inside value listenable');
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
                obscureText: value,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _hide.value = !_hide.value;
                        },
                        icon: value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility_rounded)),
                    hintText: 'Password',
                    labelText: 'Password')),
          );
        },
      )),
    );
  }
}
