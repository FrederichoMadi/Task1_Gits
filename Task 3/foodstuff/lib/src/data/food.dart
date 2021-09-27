class Food {
  String name;
  String description;
  String urlImage;

  Food({
    required this.name,
    required this.description,
    required this.urlImage,
  });
}

List<Food> dummyData = [
  Food(
    name: "Nasi Goreng",
    description:
        "Nasi goreng adalah sebuah makanan berupa nasi yang digoreng dan diaduk dalam minyak goreng, margarin, atau mentega. Biasanya ditambah kecap manis, bawang merah, bawang putih, asam jawa, lada dan bumbu-bumbu lainnya; seperti telur, ayam, dan kerupuk.",
    urlImage:
        "https://cdn-2.tstatic.net/tribunnews/foto/bank/images/cara-masak-nasi-goreng-sederhana-tapi-enak-banget-ala-pedagang-gerobak.jpg",
  ),
  Food(
      name: "Sate",
      description:
          "Sate atau satai adalah makanan yang terbuat dari daging yang dipotong kecil-kecil dan ditusuk sedemikian rupa dengan tusukan lidi tulang daun kelapa atau bambu, kemudian dipanggang menggunakan bara arang kayu. Sate disajikan dengan berbagai macam bumbu yang bergantung pada variasi resep sate.",
      urlImage: "http://kbu-cdn.com/dk/wp-content/uploads/sate-ayam.jpg"),
  Food(
    name: "Rendang",
    description:
        "Rendang atau randang adalah masakan daging asli Indonesia yang berasal dari Minangkabau. Masakan ini dihasilkan dari proses memasak suhu rendah dalam waktu lama menggunakan aneka rempah-rempah dan santan.",
    urlImage:
        "https://cdn-2.tstatic.net/tribunnews/foto/bank/images/resep-rendang.jpg",
  )
];
