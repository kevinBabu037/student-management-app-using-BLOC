import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet_bloc/presentation/all_students/widgets/studet_detail.dart';
import 'package:mini_projet_bloc/presentation/bloc/add_student_bloc.dart';
import '../../constant/constant.dart';

class ScreenAllStudents extends StatelessWidget{
  const ScreenAllStudents({super.key});

  @override
  Widget build(BuildContext context) { 
    context.read<StudentBloc>().add(GetAllStudentsEvent());

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar( 
         backgroundColor:const Color.fromARGB(10, 62, 60, 55) ,
        elevation: 0,
        actions: [ 
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.add_chart))
        ],
        centerTitle: true,
        title:const Text('Student List'),
      ),  
      body: Column(
        children: [
          kHeight10, 
          Padding(
            padding: const EdgeInsets.only(left: 6,right: 6),
            child: CupertinoSearchTextField(  
              onChanged: (value) {},
                  backgroundColor:  Colors.grey.withOpacity(0.1),
                  suffixIcon:const Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
                  prefixIcon:const Icon(CupertinoIcons.search,color: Colors.grey,),
                  style:const TextStyle(color: Colors.white),
                ),
          ),
          Expanded( 
             child:BlocBuilder<StudentBloc, AddStudentState>(
        builder: (context, state) {
         
          if(state is LoadingStudents){
            return const Center(child:  CircularProgressIndicator());
          }
          if(state is EmptyStudentState){
            return const Center(child: Text('No Student Found'),);
          }
           if(state is FechAllStudents){ 
             return 
              GridView.count(
             padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
             crossAxisSpacing: 10, 
             mainAxisSpacing: 10,
             childAspectRatio: 7 / 10,
             crossAxisCount: 2,
             children: List.generate(   
               state.student.length, 
               (index) { 
                 return StudetDetailsWidget(data: state.student[index]);  
               },
             ), 
           );
          }
          if(state is ErrorStudentState){
            return Center(child: Text(state.errorMsg),);
          }
          else{
            return const Center(child: SizedBox(),);
          }
       },
     )
    
   
          ),
        ],
      )
    );
  }
}

