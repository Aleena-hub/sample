
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "TextFormValidation",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: MyForm(),
        ),
      ),
    );
  }
}


class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _namecontroller=TextEditingController();
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();

  @override

  void dispose(){
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value){
    if  (value==null || value.isEmpty){
      return "Email is required";
    }
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex =RegExp(pattern);
    if(!regex.hasMatch(value)){
      return "Enter a valid email address";
    }
return null;
  }

  String? _validatePassword(String? value){
    if  (value==null || value.isEmpty){
      return "Password is required";
    }
   else if(value.length<6){
      return "Password must have 6 characters";
    }
    return null;
  }

  String? _validateName(String? value){
    if  (value==null || value.isEmpty) {
      return "Password is required";
    }
    return null;
  }

  void _submitForm(){
    if (_formkey.currentState!.validate()){
      print('Name:${_namecontroller.text}');
      print('Email:${_emailcontroller.text}');
      print('Password:${_passwordcontroller.text}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Form submitted sucessfully")));
    }
  }
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
        child:Column(
          children: [
            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(labelText: 'Name'),
              validator: _validateName,
            ),

            TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(labelText: 'Email'),
              validator: _validateEmail,
            ),

            TextFormField(
              controller: _passwordcontroller,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: _validatePassword,
            ),
SizedBox(
  height: 20,),
  ElevatedButton(
    onPressed: _submitForm,
    child: Text("Submit"),
  )
          ],
        )
    );
  }
}

