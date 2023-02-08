import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trmi_eltoque_front/trmi_exporter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => TrmiCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<TrmiCubit, TrmiState>(
          builder: (context, state) {
            if (state is TrmiInitialState) {
              return Text(state.message);
            } else if (state is TrmiFetchingState) {
              return Text(state.message);
            } else if (state is TrmiFetchSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildRow("USD", state.domain.usd ?? ""),
                  _buildRow("EUR", state.domain.eur ?? ""),
                  _buildRow("MLC", state.domain.mlc ?? ""),
                ],
              );
            } else if (state is TrmiFetchErrorState) {
              return Text(state.errorMessage);
            } else {
              return Text("Error chino");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<TrmiCubit>(context).update();
        },
        tooltip: 'Update',
        child: const Icon(Icons.update),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildRow(String currency, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(currency),
        const SizedBox(
          width: 50,
        ),
        Text(value),
      ],
    );
  }
}
