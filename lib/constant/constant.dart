import 'package:flutter/material.dart';

class Constant{
static const baseUrl="http://studentapp.ashkar.tech";

}





const kHeight10=SizedBox(height: 10,);
const kHeight20=SizedBox(height: 20,);
const kHeight30=SizedBox(height: 30,);
const kHeight40=SizedBox(height: 40,);
const kHeight50=SizedBox(height: 50,);


 

/////////////function

kPushNavigation(BuildContext context,Widget screen){
  Navigator.push(context, MaterialPageRoute(builder:(context) =>screen , ));
}

kClearAllFields(
TextEditingController namecontroller,
TextEditingController departmentcontroller,
TextEditingController phNocontroller,
TextEditingController rollNocontroller,
TextEditingController agecontroller
){
  
 namecontroller.clear();
 departmentcontroller.clear();
 phNocontroller.clear();
 rollNocontroller.clear();
 agecontroller.clear();

   
}

kSnackBar(BuildContext context,String content){
ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:Text(content) ));

}


///////text Style
 

const TextStyle kTextStyle= TextStyle(fontSize: 16.7 ,overflow: TextOverflow.ellipsis); 