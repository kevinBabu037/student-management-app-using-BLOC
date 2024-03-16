import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet_bloc/constant/constant.dart';
import 'package:mini_projet_bloc/testing/bloc/counter_bloc.dart';

class Temp extends StatelessWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('testing Bloc'),),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text('count: ${state.count}',style: kTextStyle,); 
            },
          ),), 
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<CounterBloc>().add(ImcrementEvent());
        }
        ),
    );
  }
}