
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_projet_bloc/constant/constant.dart';
import 'package:mini_projet_bloc/models/student_model.dart';
import 'package:mini_projet_bloc/presentation/all_students/widgets/edit_student.dart';
import '../../bloc/add_student_bloc.dart';



class StudetDetailsWidget extends StatelessWidget {
  const StudetDetailsWidget({
    Key? key,
    required this.data
 
  }) : super(key: key);
  final Student  data;
  @override
  Widget build(BuildContext context) {
 
    return Flexible( 
      child: BlocBuilder<StudentBloc, AddStudentState>(
        builder: (context, state) {
          return Container(
              padding:const EdgeInsets.only(left: 5), 
              decoration: BoxDecoration(
                color:  Colors.grey.withOpacity(0.1), 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Center(
                   child:   CircleAvatar(
                    backgroundImage: NetworkImage(data.image!),
                     backgroundColor: Colors.black.withOpacity(0.6),
                      radius: 40,
                    ),

                 ),  
                   Text('Name: ${data.name}',style:kTextStyle),
                   Text('Roll No: ${data.rollNo}',style:kTextStyle),
                   Text('Course: ${data.department}',style:kTextStyle),
                   Text('Ph No: ${data.phone}',style:kTextStyle),  
                    Text('Age: ${data.age}',style:kTextStyle),
                    // Text('id: ${data.id}',style:kTextStyle),
                  Row(
                    children: [
                      IconButton( 
                        onPressed: () {
                          showDialog(
                            context: context,
                             builder:(context) {
                               return  EditStudentWidget(data: data,);
                             }, );
                        },
                        icon:const Icon(Icons.edit_document, color: Colors.grey),
                      ),
                     const Spacer(),
                      IconButton(
                        onPressed: () {
                         showDialog(
                          context: context,
                           builder: (context) {
                             return AlertDialog( 
                              title:const Text('Delete'),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                },
                                 child:const Text('Cancel',style: TextStyle(color: Colors.white),),),
                                 TextButton(onPressed: (){
                                  context.read<StudentBloc>().add(DeleteStudentEvent(studentId:int.parse(data.id!) ));
                                  Navigator.pop(context);
                                  kSnackBar(context, 'Deleted Sucessfully');
                                  
                                },
                                 child:const Text('Delete',style: TextStyle(color: Colors.white),),),
                              ],
                             );
                           },);
                        },
                        icon:const Icon(Icons.delete, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
        },
      ),
    );
  }
}


