import 'package:assigment/bloc/api_bloc.dart';
import 'package:assigment/widget/api_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assigment',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test BLoC'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ApiBloc()..fetchData(),
        child: const Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: CustomWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
