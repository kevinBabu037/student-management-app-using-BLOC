import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_projet_bloc/constant/constant.dart';
import '../models/student_model.dart';


class Api {


  Future<List<Student>> getAllStudents( ) async {
    final url = Uri.parse(Constant.baseUrl);
    final headers = {
      "x-api-key": "apikey@studentapp",
    };  

    try {
      final response = await http.get(url, headers: headers); 
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body)['after exicution'];
        List<Student> students = jsonList.map((json) => Student.fromJson(json)).toList();
        return students;
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) { 
      debugPrint(e.toString());
      throw Exception("Failed to fetch students: $e");
    }
  }

/////////////////

 Future<void> createStudent(Student student) async {
    final url = Uri.parse(Constant.baseUrl);
    final headers = {
      "x-api-key": "apikey@studentapp",
    }; 

    try {
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(headers);
      
      request.fields['name'] = student.name;
      request.fields['roll_no'] = student.rollNo;
      request.fields['age'] = student.age;
      request.fields['department'] = student.department;
      request.fields['phone'] = student.phone;

      if (student.image!.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            student.image!,
          ),
        );
      }

      var response = await request.send();
      
      if (response.statusCode == 201) {
        log("Student added successfully"); 
      } else {
        throw Exception("Failed to create student: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Failed to create student: $e");
      throw Exception("Failed to create student: $e");
    }
  }


//////////////////////



Future<void> deleteStudent(int studentId) async {
    final url = Uri.parse(Constant.baseUrl);
    final headers = {
      "x-api-key": "apikey@studentapp",
     "Content-Type": "application/json",
    };

    try {
      final response = await http.delete(
        url,
        headers: headers,
        body: jsonEncode({
          'id': studentId 
          }), 
      );

      if (response.statusCode == 200) {
        log("Student deleted successfully");
      } else {
        throw Exception("Failed to delete student: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Failed to delete student: $e");
      throw Exception("Failed to delete student: $e");
    }
  }


///////////////////




Future<void> editStudent(int studentId, Student updatedStudent) async {
  final url = Uri.parse(Constant.baseUrl);
  final headers = {
    "x-api-key": "apikey@studentapp",
    "Content-Type": "application/json",
  };

  try {
    final response = await http.patch(
      url,
      headers: headers,
      body: jsonEncode({
        'id': studentId,
        'name': updatedStudent.name,
        'roll_no': int.parse(updatedStudent.rollNo),
        'age':int.parse(updatedStudent.age),
        'department': updatedStudent.department,
        'phone': updatedStudent.phone,
      }),
    );
    if (response.statusCode == 200) {
      log("Student updated successfully");
    } else {
      throw Exception("Failed to update student: ${response.statusCode}");
    }
  } catch (e) {
    debugPrint("Failed to update student: $e");
    throw Exception("Failed to update student: $e");
  }
}




  
}
