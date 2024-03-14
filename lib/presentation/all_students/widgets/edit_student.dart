



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet_bloc/constant/constant.dart';
import 'package:mini_projet_bloc/models/student_model.dart';
import 'package:mini_projet_bloc/presentation/bloc/add_student_bloc.dart';

import '../../home/widgets/text_formfild.dart';

// ignore: must_be_immutable
class EditStudentWidget extends StatelessWidget {
  const EditStudentWidget({super.key,
    required this.data
  });
 final Student  data;
  

  @override 
  Widget build(BuildContext context) {
       final namecontroller=TextEditingController(text:data.name );
       final departmentcontroller=TextEditingController(text:data.department) ;
       final phNocontroller=TextEditingController(text:data.phone);
       final rollNocontroller=TextEditingController(text:data.rollNo);
       final agecontroller=TextEditingController(text:data.age);


    return Padding(padding:const EdgeInsets.only(top: 90 ,bottom: 50 ),
      child: SingleChildScrollView(
        child: AlertDialog(
            title:  const Text('Edit'),
            content: Column(
              children: [ 
                  
                   GestureDetector(
                    onTap: () {
                     kSnackBar(context, "Image Can't Update");
                    }, 
                    child: CircleAvatar(
                       backgroundColor: Colors.black.withOpacity(0.6),
                      radius: 50,  
                      backgroundImage: NetworkImage(data.image!),
                    ),
                  ),
                 
                   
                   kHeight20,
                BuildTextformFild(hintText: 'Name',controller: namecontroller),  
                kHeight20,
               BuildTextformFild(hintText: 'Department',controller: departmentcontroller,), 
                kHeight20,
               BuildTextformFild(hintText: 'RollNo',controller: rollNocontroller,keyboardType: TextInputType.number),  
                kHeight20,
               BuildTextformFild(hintText: 'PhNo',controller: phNocontroller,keyboardType: TextInputType.number,), 
                kHeight20,
                BuildTextformFild(hintText: 'Age',controller: agecontroller),  
              ],
            ),
          
           actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child:const Text('Cancel',
            style: TextStyle(color: Colors.white),)),
           
            BlocBuilder<StudentBloc, AddStudentState>(
              builder: (context, state) {
                return TextButton(onPressed: (){ 
                       int studentId =  int.parse(data.id!);
                           Student  student =  data.copyWith(name: namecontroller.text,age:agecontroller.text ,department: departmentcontroller.text,phone: phNocontroller.text,rollNo: rollNocontroller.text);
                            context.read<StudentBloc>().add(EditStudentEvent(studentId:studentId, student: student)) ; 
                          Navigator.pop(context);
                          kSnackBar(context, 'Changes Saved');        
                        }, 
                         child:const Text('Edit',style: TextStyle(color: Colors.white)));
              },
            ),
           ],
        ),
      ),
    );
  } 
}

