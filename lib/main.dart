import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet_bloc/presentation/home/screen_home.dart';

import 'presentation/bloc/add_student_bloc.dart';

void main() { 
  runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) { 
    return  MultiBlocProvider(
      providers: [ 
        BlocProvider(create: (context) =>StudentBloc()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(), 
        home:  ScreenHome(),
      ),
    );
   
  }
}


