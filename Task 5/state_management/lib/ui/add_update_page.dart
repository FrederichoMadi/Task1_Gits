import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:state_management/model/data.dart';
import 'package:state_management/provider/data_provider.dart';
import 'package:state_management/ui/home_page.dart';

class AddUpdatePage extends StatefulWidget {
  static const routeName = '/form-stuff';
  final Data? data;

  AddUpdatePage([this.data]);

  @override
  _AddUpdatePageState createState() => _AddUpdatePageState();
}

class _AddUpdatePageState extends State<AddUpdatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      _nameController.text = widget.data!.name;
      _descriptionController.text = widget.data!.description;
      _stokController.text = widget.data!.stok.toString();
      isUpdate = true;
    } else {
      _nameController.clear();
      _descriptionController.clear();
      _stokController.clear();
      isUpdate = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Form Inventaris",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name Stuff",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: "Description Stuff",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _stokController,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Stok Stuff",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<DataProvider>(
                    builder: (context, data, child) {
                      return !isUpdate
                          ? ElevatedButton(
                              onPressed: () {
                                Data newData = Data(
                                  name: _nameController.text,
                                  description: _descriptionController.text,
                                  stok: int.parse(_stokController.text),
                                );

                                data.addData(newData);
                                Navigator.pop(context);
                              },
                              child: Text("Simpan"),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    data.updateData(
                                      widget.data!,
                                      _nameController.text,
                                      _descriptionController.text,
                                      int.parse(_stokController.text),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text("Update"),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    data.deleteData(widget.data!);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Delete"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                ),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _stokController.dispose();
    super.dispose();
  }
}
