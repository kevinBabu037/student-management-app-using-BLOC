part of 'add_student_bloc.dart';


 class StudentEvent {}



class TakeImageEvent extends StudentEvent{}

class ClearImage extends StudentEvent{}
class GetAllStudentsEvent extends StudentEvent {}


class CreateStudentEvent extends StudentEvent {
  final Student student;
  CreateStudentEvent(this.student); 
}

class EditStudentEvent extends StudentEvent{
  final int studentId;
  final Student student;

  EditStudentEvent({required this.studentId, required this.student});

}

class ErrorStudentEvent extends StudentEvent {}
 
class DeleteStudentEvent extends StudentEvent{
 final int studentId;

  DeleteStudentEvent({required this.studentId});
}
class SearchStudentEvent extends StudentEvent{
  final String searchQuery;

  SearchStudentEvent({required this.searchQuery});
}
 