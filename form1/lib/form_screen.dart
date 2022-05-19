import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var _name = '';
  var _email = '';
  var _password = '';
  var _phoneNumber = '';
  var _address = '';
  var _qualification = '';
  var _age = '';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget _buildNameField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Name',
            icon: Icon(
              Icons.person,
              color: Colors.blue,
            )),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name is required';
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  Widget _buildEmail() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Email',
            icon: Icon(
              Icons.mail,
              color: Colors.red,
            )),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return "Please Enter a Valid Email Address";
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Password',
            icon: Icon(
              Icons.key,
              color: Colors.black,
            )),
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Phone Number',
            icon: Icon(
              Icons.phone,
              color: Colors.green,
            )),
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Phone number is required';
          }
          if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
            return "Please Enter a Valid Phone Number";
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  Widget _buildAddress() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Address',
            icon: Icon(
              Icons.place,
              color: Colors.pink[900],
            )),
        keyboardType: TextInputType.streetAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Address is required';
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  Widget _buildQualification() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Qualification',
            icon: Icon(
              Icons.cast_for_education,
              color: Colors.cyan,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Qualification is required';
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  Widget _buildAge() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Date of Birth'),
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name is required';
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.yellow],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 90, top: 20),
                  child: Text(
                    "APPLICATION FORM",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Container(
                    child: Center(child: Text("Photo")),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87)),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(24),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildNameField(),
                      _buildEmail(),
                      _buildPassword(),
                      _buildPhoneNumber(),
                      _buildAddress(),
                      _buildQualification(),
                      //_buildAge(),
                      SizedBox(
                        height: 100,
                      ),
                      ElevatedButton(
                          onPressed: () => {
                                if (_formkey.currentState!.validate())
                                  {}
                                else
                                  _formkey.currentState!.save(),
                                print("Saved Succesfully")
                              },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
