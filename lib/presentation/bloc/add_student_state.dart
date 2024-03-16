part of 'add_student_bloc.dart';

 class AddStudentState {}

  class InitialStudent extends AddStudentState{}

  class StudentLoading extends AddStudentState{}

 class ErrorStudentState extends AddStudentState{
 final String errorMsg; 
  ErrorStudentState({required this.errorMsg});
}

  class EmptyStudentState extends AddStudentState {}


  class FechAllStudents extends AddStudentState{
  final List<Student> student;
  FechAllStudents({required this.student,});

 }


 class ImagePicking extends AddStudentState{
   final String imagepath;
  ImagePicking({required this.imagepath});
 } 






 




 
