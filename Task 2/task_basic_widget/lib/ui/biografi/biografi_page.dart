import 'package:flutter/material.dart';
import 'package:task_basic_widget/model/user.dart';
import 'package:task_basic_widget/widget/card_dialog.dart';
import 'package:task_basic_widget/widget/form_field.dart';
import 'package:task_basic_widget/widget/gender.dart';

class BiografiPage extends StatefulWidget {
  static String routeName = "/biografi";
  final User user;

  BiografiPage({required this.user});

  @override
  _BiografiPageState createState() => _BiografiPageState();
}

class _BiografiPageState extends State<BiografiPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _biografiController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  DateTime selectDate = DateTime.now();
  TimeOfDay selectTime = TimeOfDay(hour: 00, minute: 00);
  String? _setDate, _setTime;

  Gender? gender = Gender.Male;

  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        selectDate = picked;

        _dateController.text =
            "${selectDate.day}/${selectDate.month}/${selectDate.year}";
        user.date = _dateController.text;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectTime,
    );

    if (picked != null) {
      setState(() {
        selectTime = picked;
        _timeController.text = "${selectTime.hour} : ${selectTime.minute}";
      });
    }
  }

  @override
  void initState() {
    _nameController.text = "${user.name}";
    _usernameController.text = "${user.username}";
    _biografiController.text = "${user.biografi}";
    _websiteController.text = "${user.website}";

    if (user.date == "") {
      _dateController.text = "Select Date";
    } else {
      _dateController.text = user.date;
    }

    _timeController.text = "Select Time";

    user.name = _nameController.text;
    user.username = _usernameController.text;
    user.biografi = _biografiController.text;
    user.website = _websiteController.text;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _biografiController.dispose();
    _websiteController.dispose();
    _dateController.dispose();
    _timeController.dispose();
  }

  Widget chooseDate(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectedDate(context);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: _dateController,
          textAlign: TextAlign.center,
          enabled: false,
          textAlignVertical: TextAlignVertical.top,
          decoration: const InputDecoration(
            prefix: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(5),
          ),
          onSaved: (value) {
            _setTime = value!;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget chooseGender() {
      return Row(
        children: [
          Radio(
            value: Gender.Male,
            groupValue: user.gender,
            onChanged: (Gender? value) {
              setState(() {
                gender = value;
                user.gender = gender!;
              });
            },
          ),
          Text("Male"),
          Radio(
            value: Gender.Female,
            groupValue: user.gender,
            onChanged: (Gender? value) {
              setState(() {
                gender = value;
                user.gender = gender!;
              });
            },
          ),
          Text("Female"),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.cancel_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return dialogCard(context, user);
                  });
            },
            icon: Icon(Icons.check, color: Colors.lightBlue),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image(
                          width: 100,
                          height: 100,
                          image: NetworkImage(
                            user.image,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Coming Soon"),
                            ),
                          );
                        },
                        child: Text(
                          "Change Profile Photo",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Name"),
                formField("Name", _nameController, user.name),
                SizedBox(height: 10),
                Text("Username"),
                formField("Username", _usernameController, user.username),
                SizedBox(height: 10),
                Text("Bio"),
                formField("Bio", _biografiController, user.biografi),
                SizedBox(height: 10),
                Text("Website"),
                formField("Website", _websiteController, user.website),
                SizedBox(height: 20),
                Text(
                  "Choose gender",
                ),
                chooseGender(),
                SizedBox(height: 10),
                Text('Choose Date Birthday'),
                SizedBox(height: 8),
                chooseDate(context),
                SizedBox(height: 20),
                ListTile(
                  leading: Checkbox(
                    value: user.isCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        user.isCheck = value!;
                      });
                    },
                  ),
                  subtitle: Text(
                      "I have read and agree to the terms of use and privacy policy"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
