import 'package:task_basic_widget/widget/gender.dart';

class User {
  late String name;
  late String username;
  late String image;
  late String biografi;
  late String website;
  late String date;
  late Gender gender;
  late bool isCheck;

  User({
    required this.name,
    required this.username,
    required this.image,
    required this.biografi,
    required this.website,
    required this.date,
    required this.gender,
    required this.isCheck,
  });
}

var user = User(
  name: "Fredericho Madi",
  username: "fredericho_madi",
  image:
      "https://previews.123rf.com/images/pandavector/pandavector1901/pandavector190105477/115490218-vector-illustration-of-avatar-and-dummy-icon-set-of-avatar-and-image-vector-icon-for-stock-.jpg",
  biografi: "Studi Independent - GITS (2021)",
  website: "www.frederichomadi.com",
  date: "",
  gender: Gender.Male,
  isCheck: false,
);
