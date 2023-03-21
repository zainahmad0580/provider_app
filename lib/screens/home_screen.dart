import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/count_provider.dart';
import '../route/routes_name.dart';

//UPDATE VALUE WITHOUT USING STATEFUL WIDGET
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Inside build');
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter with timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => countProvider.resetCount(),
                child: const Text('Reset')),
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CountProvider>(
              builder: (context, value, child) {
                print('Inside Consumer, update count');
                return Text(
                  value.count.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.slider);
                },
                child: const Text('Slider Screen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.value);
                },
                child: const Text('Value Notifier'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
