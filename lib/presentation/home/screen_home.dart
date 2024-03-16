

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet_bloc/models/student_model.dart';
import 'package:mini_projet_bloc/presentation/all_students/screen_all_students.dart';
import 'package:mini_projet_bloc/testing/temp.dart';
import '../../constant/constant.dart';
import '../bloc/add_student_bloc.dart';
import 'widgets/text_formfild.dart';

class ScreenHome extends StatelessWidget {
    ScreenHome({super.key});
    

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final namecontroller=TextEditingController();
  final departmentcontroller=TextEditingController();
  final phNocontroller=TextEditingController();
  final rollNocontroller=TextEditingController(); 
  final ageController=TextEditingController();           
 
  @override
  Widget build(BuildContext context){
        return  Scaffold( 
        appBar: AppBar(
          elevation: 0, 
          backgroundColor: const Color.fromARGB(10, 62, 60, 55),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenAllStudents()),
                );
              },
              icon: const Icon(Icons.list),
            ),
          ],
          centerTitle: true, 
          title:GestureDetector(
            onTap: () {
              kPushNavigation(context,const Temp());
            },
            child: const Text('Add Student')
            ),
           
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10), 
            child: Form(
              key: _formKey, 
              child: Column(
                children: [
                  kHeight30,
                GestureDetector(
                       onTap: () { 
                         context.read<StudentBloc>().add(TakeImageEvent()); 
                      }, 
                      child: BlocBuilder<StudentBloc, AddStudentState>(
               builder: (context, state) {
                 return Stack(
                   children: [ 
                     state is ImagePicking?
                      CircleAvatar( 
                       backgroundColor: Colors.black.withOpacity(0.6),
                       radius: 60,
                       backgroundImage:FileImage(File(state.imagepath))           
                     ):
                     CircleAvatar( 
                       backgroundColor: Colors.black.withOpacity(0.6),
                       radius: 60,
                       backgroundImage:const NetworkImage('https://i.pinimg.com/564x/4d/ec/b4/4decb460e5d38ea8e756ac1cc29f008a.jpg'),          
                     )
                    
                   ], 
                 );
               }, 
             ),
                    ),
                  
                  kHeight40,
                  BuildTextformFild(
                    controller: namecontroller, 
                    hintText: 'Name',
                  ),

                  kHeight20,
                  BuildTextformFild(
                    keyboardType: TextInputType.number,
                    controller:rollNocontroller ,
                    hintText: 'Roll No',
                  ),

                  kHeight20, 
                  BuildTextformFild(
                    controller: departmentcontroller,
                    hintText: 'Department',
                  ),

                  kHeight20,
                  BuildTextformFild(
                    // keyboardType: TextInputType.number,
                    controller: phNocontroller,
                    hintText: 'Ph No',
                  ),
                   kHeight20,
                   BuildTextformFild(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    hintText: 'Age', 
                  ),

                  kHeight40,
                  SizedBox(
                    width: 150,
                    child: BlocBuilder<StudentBloc, AddStudentState>(
                      builder: (context, state) {
                        return ElevatedButton( 
                          onPressed: () async { 
                  if (_formKey.currentState!.validate()){
                    if(state is ImagePicking ){
                      context.read<StudentBloc>().add(CreateStudentEvent(
                        Student(name: namecontroller.text, rollNo: rollNocontroller.text, age: ageController.text, department: departmentcontroller.text, phone: phNocontroller.text, image:state.imagepath)
                      ));
                    }
                    context.read<StudentBloc>().add(ClearImage());
                    kClearAllFields(namecontroller, departmentcontroller, phNocontroller, rollNocontroller, ageController);
                    kSnackBar(context, 'Student Added');
                  }
               },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6),  
                    ),
                    child: const Text('Save'),
                  );
                 },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}



