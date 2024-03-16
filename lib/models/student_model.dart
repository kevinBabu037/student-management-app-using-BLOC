class Student {
  final String? id;
  final String name;
  final String rollNo;
  final String age;
  final String department;
  final String phone;
  final String? image;

  Student({
     this.id,
    required this.name,
    required this.rollNo,
    required this.age,
    required this.department,
    required this.phone,
     this.image,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      rollNo: json['roll_no'],
      age: json['age'],
      department: json['department'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'roll_no': rollNo,
      'age': age,
      'department': department,
      'phone': phone,
      'image': image,
    };
  }

    Student copyWith({
    String? name,
    String? department,
    String? rollNo,
    String? phone,
    String? age,
   }){
    return Student(
      age:age?? this.age,
      department: department?? this.department,
      name: name ?? this.name,
       phone: phone ??this. phone,
       rollNo: rollNo?? this.rollNo);

   }


}
