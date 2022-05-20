import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  var _items = ['App Developer', 'Website developer', 'Others'];
  String? value;
  var _currentItemSelected = 'App Developer';
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
            labelStyle: TextStyle(color: Colors.black),
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
            labelStyle: TextStyle(color: Colors.black),
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
            labelStyle: TextStyle(color: Colors.black),
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
            labelStyle: TextStyle(color: Colors.black),
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
            labelStyle: TextStyle(color: Colors.black),
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
            labelStyle: TextStyle(color: Colors.black),
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
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          labelStyle: TextStyle(color: Colors.black),
          icon: Icon(Icons.calendar_month_outlined),
        ),
        keyboardType: TextInputType.datetime,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Age is required';
          }
        },
        onSaved: (value) {
          _name = 'value';
        });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "APPLICATION FORM",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              DropdownButton<String>(
                items: _items.map((String Dropdownstring) {
                  return DropdownMenuItem<String>(
                    value: Dropdownstring,
                    child: Text(Dropdownstring),
                  );
                }).toList(),
                onChanged: (nnDropdownstring) {
                  setState(() {
                    value = nnDropdownstring!;
                  });
                  value = "new";
                },
              ),
              Container(
                child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black87,
                    controller: _tabcontroller,
                    tabs: [
                      Tab(
                        text: "Personal Detail",
                      ),
                      Tab(
                        text: "Doc upload",
                      ),
                      Tab(
                        text: "Preview Form",
                      )
                    ]),
              ),
              Container(
                width: double.maxFinite,
                height: 750,
                child: TabBarView(controller: _tabcontroller, children: [
                  Container(
                    margin: EdgeInsets.all(24),
                    child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildNameField(),
                            _buildEmail(),
                            _buildPassword(),
                            _buildPhoneNumber(),
                            _buildAddress(),
                            _buildQualification(),
                            _buildAge(),
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
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ))
                          ],
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          "UPLOAD DOCUMENTS",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: null,
                          child: Text("Upload",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal))),
                    ],
                  ),
                  Center(
                    child: Text(
                      "PREVIEW DATA",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
