import 'package:flutter/material.dart';
import 'package:profiles/Screens/profilesScreen.dart';
import 'package:intl/intl.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Edit_ProfileScreen extends StatefulWidget {
  static const routeName = '/EditProfile-screen';

  const Edit_ProfileScreen({Key? key}) : super(key: key);

  @override
  State<Edit_ProfileScreen> createState() => _Edit_ProfileScreenState();
}

class _Edit_ProfileScreenState extends State<Edit_ProfileScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  FocusNode userNameFocus = FocusNode();

  Object? get date => null;
  MaterialStateTextStyle labelStyle() {
    return MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
      return const TextStyle(
        fontSize: 14,
      );
    });
  }

  void _presentDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectdate) {
      setState(() {
        selectdate = pickedDate;
      });
    }
  }
  // void presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2022),
  //     lastDate: DateTime.now(),
  //   ).then((PickedDate) {
  //     if (PickedDate == null) {
  //       return;
  //     }
  //     setState(() {
  //       selectdate = PickedDate;
  //     });
  //   });
  //   print('...');
  // }

  final formKey = GlobalKey<FormState>();
  String? name;
  String? gender;
  DateTime? selectdate;
  String? phoneNumber;
  String? countryCode;
  String? Email;
  String? selectedItem;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _age;
  String? _bloodGroup;
  String? _height;
  String? _weight;

  final Map<String, String> _dropDownItems = {
    'male': 'Male',
    'female': 'Female'
  };

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Container(
            height: mediaQuery.height * 0.10,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.green,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Edit Profiles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //sliver appBar
                ],
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.15,
            child: Expanded(
                child: SizedBox(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              "http://picsum.photos/200/300",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hazim sief",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "hazemsief@gmail.com",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
          Divider(),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Personal Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.person_outlined)),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    border: OutlineInputBorder(
                                      // borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "enter your name";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    name = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.02,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Gender",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            value: gender,
                            items: [
                              DropdownMenuItem(
                                value: "male",
                                child: Text("Male"),
                              ),
                              DropdownMenuItem(
                                value: "female",
                                child: Text("Female"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Choose your gender";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.02,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: selectdate == null
                                          ? 'No Date Chosen!'
                                          : 'Picked Date: ${DateFormat.yMd().format(selectdate!)}',
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_today),
                                        onPressed: () =>
                                            _presentDatePicker(context),
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 16)),
                                  readOnly: true,
                                  onTap: () => _presentDatePicker(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "(01)",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.phone), onPressed: () {}),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your phone number";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              phoneNumber = value;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email address",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.email), onPressed: () {}),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                print(value);
                              }
                            },
                          ),
                        ),
                        Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Health Information',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4),
                                      Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Age: 22",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              focusedBorder: InputBorder.none),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Age :";
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              _age = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            hintText: 'Blood group',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 16),
                                            focusedBorder: InputBorder.none,
                                            // border: OutlineInputBorder(
                                            //   borderRadius:
                                            //       BorderRadius.circular(10),
                                            //   borderSide:
                                            //       BorderSide(color: Colors.black),
                                            // ),
                                          ),
                                          value: _bloodGroup,
                                          items: [
                                            DropdownMenuItem(
                                              value: 'A+',
                                              child: Text('A+'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'A-',
                                              child: Text('A-'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'B+',
                                              child: Text('B+'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'B-',
                                              child: Text('B-'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'O+',
                                              child: Text('O+'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'O-',
                                              child: Text('O-'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'AB+',
                                              child: Text('AB+'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'AB-',
                                              child: Text('AB-'),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              _bloodGroup = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select your blood group';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              _bloodGroup = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                print(_age);
                                print(_bloodGroup);
                              },
                              child: Text('Update Profile'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10)),

//                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
