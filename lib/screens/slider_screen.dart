import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/slider_provider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Inside build');
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Slider Screen')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context, value, child) {
              print('Inside consumer');
              return Column(
                children: [
                  Slider(
                    value: value.sliderValue,
                    onChanged: (newValue) {
                      value.setSliderValue(newValue);
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color:
                                    Colors.red.withOpacity(value.sliderValue)),
                            child: const Text('Container 1')),
                      ),
                      Expanded(
                        child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.green
                                    .withOpacity(value.sliderValue)),
                            child: const Text('Container 2')),
                      ),
                    ],
                  )
                ],
              );
            })
          ],
        ));
  }
}
