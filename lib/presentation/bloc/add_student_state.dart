part of 'add_student_bloc.dart';

 class AddStudentState {}

 final class InitialStudent extends AddStudentState{}

 class StudentLoading extends AddStudentState{}

class ErrorStudentState extends AddStudentState{
 final String errorMsg;

  ErrorStudentState({required this.errorMsg});
}
 
 ////////////

 class StudenError extends AddStudentState{

   final String errorMsg;

  StudenError({required this.errorMsg});
 } 


 class ImagePicking extends AddStudentState{

   final String imagepath;

  ImagePicking({required this.imagepath});
 }


 ////////////////////////
 



  class EmptyStudentState extends AddStudentState {
    
  }

 class LoadingStudents extends AddStudentState{}
 
 class FechAllStudents extends AddStudentState{
  final List<Student> student;
  FechAllStudents({
    required this.student,
  });

 }