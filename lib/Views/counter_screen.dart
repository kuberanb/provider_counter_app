import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    print('build');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Counter Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              right: 0.2 * screenWidth, left: 0.2 * screenWidth),
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CounterProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Center(
                      child: Text(
                        value.count.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(right: 0.2 * screenWidth, left: 0.2 * screenWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().reduceCount();
                log('count reduced');
              },
              child: const Icon(
                Icons.remove,
                size: 25,
                color: Colors.black,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().increaseCount();
                log('count increased');
              },
              child: const Icon(
                Icons.add,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
