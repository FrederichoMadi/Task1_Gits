import 'package:flutter/material.dart';

class ResultDialog extends StatefulWidget {
  final String title, description, date, time, reminder, guru;

  ResultDialog(
      {required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.reminder,
      required this.guru});

  @override
  ResultDialogState createState() => ResultDialogState();
}

class ResultDialogState extends State<ResultDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _contentBox(context),
    );
  }

  _contentBox(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 20,
          ),
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 8), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Hasil Data',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Title : ${widget.title}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Description : \n${widget.description}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Date : ${widget.date}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Reminder : ${widget.reminder}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Guru : ${widget.guru}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Kembali')),
              )
            ],
          ),
        )
      ],
    );
  }
}
