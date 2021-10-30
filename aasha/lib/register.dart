import 'dart:ui';
import 'package:checkdigit/checkdigit.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DateTime selectedDate = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);
  final _formKey = GlobalKey<FormState>();

  _pickdate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1850),
        lastDate: DateTime(DateTime.now().year - 18));
    if (date != null && date != selectedDate) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 41, 41, 1),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      style: TextStyle(
                          color: Color.fromRGBO(185, 152, 255, 1),
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Signup to",
                      style: TextStyle(
                          color: Color.fromRGBO(185, 152, 255, 1),
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Vote",
                      style: TextStyle(
                          color: Color.fromRGBO(185, 152, 255, 1),
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 2.2 / 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ]),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 2.2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ]),
                    child: TextFormField(
                      validator: (value) {
                        if (!verhoeff.validate(value.toString()) ||
                            value!.isEmpty) {
                          return 'Please enter a valid Aadhar number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Aadhar Number',
                        hintStyle: TextStyle(color: Colors.black54),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 2.2 / 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ]),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.event,
                          color: Colors.black54,
                        ),
                        title: Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          style: TextStyle(color: Colors.black54),
                        ),
                        onTap: _pickdate,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 2.2 / 3,
                  height: 48,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(185, 152, 255, 1)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("yes");
                      } else {
                        print("no");
                      }
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
