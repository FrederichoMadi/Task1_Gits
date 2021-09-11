import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_basic_widget/task3/result_dialog.dart';

enum Teacher { Messi, Ronaldo, Neymar, Lewandoski, Mbappe, Haaland }

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //controller
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _datePicker = TextEditingController();
  TextEditingController _timePicker = TextEditingController();

  DateTime selectDate = DateTime.now();
  TimeOfDay selectTime = TimeOfDay(hour: 00, minute: 0);

  String? _setTime, _setDate;

  bool isReminder = false;

  Teacher guru = Teacher.Messi;

  final _formKey = GlobalKey<FormState>();

  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        selectDate = picked;

        _datePicker.text = DateFormat.yMd().format(selectDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: selectTime);

    if (picked != null) {
      setState(() {
        selectTime = picked;
        _timePicker.text = "${selectTime.hour} : ${selectTime.minute}";
        _timePicker.text = formatDate(
            DateTime(2021, 10, 10, selectTime.hour, selectTime.minute),
            [hh, ' : ', nn, " ", am]).toString();
      });
    }
  }

  @override
  void initState() {
    _datePicker.text = DateFormat.yMd().format(DateTime.now());
    _timePicker.text = formatDate(
        DateTime(
          2021,
          10,
          9,
          DateTime.now().hour,
          DateTime.now().minute,
        ),
        [hh, ' : ', nn, ' ', am]).toString();
    super.initState();
  }

  double horizontalBall(BuildContext context) =>
      MediaQuery.of(context).size.width * 1 / 3;
  double bigCircle(BuildContext context) =>
      MediaQuery.of(context).size.width * 6 / 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCCFD4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                height: horizontalBall(context),
                width: horizontalBall(context),
                child: Image.asset('assets/ball.jpg', fit: BoxFit.cover),
              ),
            ),
            Positioned(
              left: -bigCircle(context) / 3,
              top: -bigCircle(context) / 3,
              child: Container(
                height: bigCircle(context),
                width: bigCircle(context),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFF822682), Color(0xFFFF4891)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _formPage(context),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            splashColor: Colors.purple[900],
                            borderRadius: BorderRadius.circular(10),
                            child: const Center(
                              child: Text(
                                'Submit Data',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ResultDialog(
                                      title: _titleController.text,
                                      description: _descriptionController.text,
                                      date: _datePicker.text,
                                      time: _timePicker.text,
                                      reminder: isReminder.toString(),
                                      guru: guru.toString().split('.').last,
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form _formPage(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              'Jadwal\n\t\tLatihan',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    height: 1,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Judul Kegiatan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              controller: _titleController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Masukan Judul...',
                hoverColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Judul tidak boleh kosong';
                }
                _titleController.text = value;
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Deskripsi Kegiatan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Masukan Deskripsi...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Description tidak boleh kosong';
                }
                _descriptionController.text = value;
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Pilih tanggal dan Jam',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _selectedDate(context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _datePicker,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    enabled: false,
                    decoration: const InputDecoration(
                      prefixIcon:
                          Icon(Icons.date_range_rounded, color: Colors.black),
                      disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.all(5),
                    ),
                    onSaved: (String? value) {
                      _setDate = value;
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _selectTime(context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                      controller: _timePicker,
                      enabled: false,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.timer, color: Colors.black),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      onSaved: (String? value) {
                        _setTime = value;
                      }),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: isReminder,
                onChanged: (value) {
                  setState(() {
                    isReminder = value!;
                  });
                },
              ),
              Text('Aktifkan Notifikasi',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Pilih Guru',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                          'https://akcdn.detik.net.id/community/media/visual/2021/09/10/lionel-messi-2_169.jpeg?w=700&q=90',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 90,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Teacher.Messi,
                              groupValue: guru,
                              onChanged: (Teacher? value) {
                                setState(() {
                                  guru = value!;
                                });
                              },
                            ),
                            const Text('Lionel Messi')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                          'https://akcdn.detik.net.id/community/media/visual/2021/09/01/cristiano-ronaldo-6_43.jpeg?w=700&q=90',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 90,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Teacher.Ronaldo,
                              groupValue: guru,
                              onChanged: (Teacher? value) {
                                setState(() {
                                  guru = value!;
                                });
                              },
                            ),
                            const Flexible(
                              child: Text('Cristiano Ronaldo',
                                  overflow: TextOverflow.ellipsis, maxLines: 2),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                          'https://img.okezone.com/content/2021/02/17/51/2363551/5-perempuan-seksi-yang-pernah-dipacari-neymar-jr-ada-ibu-dari-sang-anak-vMT5FRWhEU.jpg',
                          fit: BoxFit.fitWidth,
                          width: 150,
                          height: 90,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Teacher.Neymar,
                              groupValue: guru,
                              onChanged: (Teacher? value) {
                                setState(() {
                                  guru = value!;
                                });
                              },
                            ),
                            const Text('Neymar Jr')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                          'https://awsimages.detik.net.id/community/media/visual/2020/08/09/robert-lewandowski.jpeg?w=650&q=80',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 90,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Teacher.Lewandoski,
                              groupValue: guru,
                              onChanged: (Teacher? value) {
                                guru = value!;
                              },
                            ),
                            const Flexible(
                                child: Text(
                              'Robert Lewandoski',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                          'https://img.okezone.com/content/2021/08/27/51/2462099/pindah-ke-real-madrid-kylian-mbappe-ingin-kenakan-nomor-punggung-seperti-idolanya-XW8F2uV20n.jpg',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 90,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Teacher.Mbappe,
                              groupValue: guru,
                              onChanged: (Teacher? value) {
                                setState(() {
                                  guru = value!;
                                });
                              },
                            ),
                            const Flexible(
                              child: Text(
                                'Kylian Mbbape',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Card(
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image.network(
                          'https://pict-a.sindonews.net/dyn/620/pena/news/2021/03/26/11/377452/dortmund-patok-harga-jual-erling-haaland-rp3-triliun-avu.png',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 90,
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Teacher.Haaland,
                              groupValue: guru,
                              onChanged: (Teacher? value) {
                                setState(() {
                                  guru = value!;
                                });
                              },
                            ),
                            const Text('Erling Haaland')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
