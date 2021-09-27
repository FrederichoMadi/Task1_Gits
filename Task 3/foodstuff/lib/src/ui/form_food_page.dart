import 'package:flutter/material.dart';
import 'package:foodstuff/src/data/food.dart';
import 'package:foodstuff/src/widget/form_food.dart';

class FormFoodPage extends StatefulWidget {
  static const routeName = "/form-food";
  final Food? food;

  FormFoodPage([this.food]);

  @override
  _FormFoodPageState createState() => _FormFoodPageState();
}

class _FormFoodPageState extends State<FormFoodPage> {
  TextEditingController _urlImageController = TextEditingController();
  TextEditingController _nameFoodController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.food != null) {
      _urlImageController.text = widget.food!.urlImage;
      _nameFoodController.text = widget.food!.name;
      _descriptionController.text = widget.food!.description;
      isUpdate = true;
    } else {
      _urlImageController.clear();
      _nameFoodController.clear();
      _descriptionController.clear();
      isUpdate = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 8.0,
                  ),
                  child: Text(
                    "Form Page Food",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 32.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: formFood(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column formFood(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _urlImageController,
          decoration: const InputDecoration(
            labelText: "Url Image",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _nameFoodController,
          decoration: const InputDecoration(
            labelText: "Name",
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
            labelText: "description",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        !isUpdate
            ? ElevatedButton(
                onPressed: () {
                  if (!isUpdate) {
                    setState(() {
                      Food newFood = Food(
                        name: _nameFoodController.text,
                        description: _descriptionController.text,
                        urlImage: _urlImageController.text,
                      );

                      dummyData.add(newFood);
                    });
                  }
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    Text("Save"),
                  ],
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  widget.food!.urlImage = _urlImageController.text;
                  widget.food!.name = _nameFoodController.text;
                  widget.food!.description = _descriptionController.text;

                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    Text("Update"),
                  ],
                ),
              ),
      ],
    );
  }

  @override
  void dispose() {
    _urlImageController.dispose();
    _nameFoodController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
