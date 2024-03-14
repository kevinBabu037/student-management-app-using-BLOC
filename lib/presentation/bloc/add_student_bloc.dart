import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:mini_projet_bloc/api/api_services.dart';
import 'package:mini_projet_bloc/models/student_model.dart';
part 'add_student_event.dart';
part 'add_student_state.dart';

class StudentBloc extends Bloc<StudentEvent, AddStudentState> {
  StudentBloc() : super(InitialStudent()){
    Api api =Api();
    
    on<CreateStudentEvent>((event, emit)async {
       emit(StudentLoading());
       await api.createStudent(event.student); 
       final List <Student> updatedStudent=await api.getAllStudents();
       emit(FechAllStudents(student: updatedStudent));
    });  

    on<TakeImageEvent>(takeImageEvent);
 
    on<ClearImage>((event, emit) {
      emit(InitialStudent());
    });

    on<DeleteStudentEvent>((event, emit)async {
      await api.deleteStudent(event.studentId); 
     final List <Student> updatedStudent=await api.getAllStudents();
     emit(FechAllStudents(student: updatedStudent));
    });



     on<GetAllStudentsEvent>((event, emit)async {

      try {
        emit(LoadingStudents());
        final List<Student> student=await api.getAllStudents();
        emit(FechAllStudents(student: student, ));
        
      } catch (e) {
        emit(ErrorStudentState(errorMsg: 'Error$e'));
      }
     });


     on<EditStudentEvent>((event, emit)async{
      await api.editStudent(event.studentId, event.student);
      final List <Student> updatedStudent=await api.getAllStudents();
      emit(FechAllStudents(student: updatedStudent));

     });

     
   
  }
    


  FutureOr<void> takeImageEvent(TakeImageEvent event, Emitter<AddStudentState> emit)async {
     final pickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
       if(pickedFile!=null){
         final image=pickedFile.path;
         emit(ImagePicking(imagepath: image));
       }
  }
}


