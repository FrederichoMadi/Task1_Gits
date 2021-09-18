import 'dart:io';

import 'model/consumer.dart';
import 'model/seller.dart';

void main() => login();

//data seller
Seller seller1 = Seller(
    nama_toko: "Murah Meriah",
    no_hp: "08101929387",
    email: "murahmeriah@gmail.com",
    barang: "Sepatu",
    stok: 10,
    harga: 100000);

Seller seller2 = Seller(
    nama_toko: "Berkah Jaya",
    no_hp: "081019887923",
    email: "berkahjaya@gmail.com",
    barang: "Celana Chino Jeans",
    stok: 10,
    harga: 150000);

List<Seller> dataToko = [seller1, seller2];

//data consumer
Consumer consumer1 = Consumer(
    name: "Budi",
    password: "12345",
    no_hp: "08123456789",
    email: "budi@gmail.com",
    saldo: 0);
Consumer consumer2 = Consumer(
    name: "Andy",
    password: "54321",
    no_hp: "08112233445",
    email: "andy@gmail.com",
    saldo: 200000);

List<Consumer> dataConsumer = [consumer1, consumer2];
Consumer? current;

void login() {
  print("===== APLIKASI BELANJA ======");
  print("${'*' * 10}Login Page${'*' * 10}");
  stdout.write("Masukan Email : ");
  var email = stdin.readLineSync()!;
  stdout.write("Masukan Password : ");
  var password = stdin.readLineSync()!;

  dataConsumer.forEach((Consumer e) {
    if (email == e.email && password == e.password) current = e;
  });

  if (current != null) {
    menuBelanja(dataToko);
  } else {
    print("Akun anda tidak ditemukan \n");
    login();
  }
}

void menuBelanja(List<Seller> dataToko) {
  var pilihan;

  do {
    print("${'=' * 5}Home Page${'=' * 5}");
    print("1. Halaman Toko");
    print("2. Halaman Profile");
    print("3. Isi Saldo");
    print("4. Logout");
    print("5. Keluar Aplikasi");
    stdout.write("Masukan Pilihan : ");
    pilihan = stdin.readLineSync()!;

    switch (pilihan) {
      case 1:
      case '1':
        halamanToko(dataToko);
        break;
      case 2:
      case '2':
        halamanProfile();
        break;
      case 3:
      case '3':
        print("${'=' * 5}Halaman Tambah Saldo${'=' * 5}");
        print("Masukan Saldo\t: ");
        var saldo = int.tryParse(stdin.readLineSync()!);
        current!.saldo = current!.saldo + saldo!;
        print("Saldo Anda : Rp. ${current!.saldo}\n");
        menuBelanja(dataToko);
        break;
      case 4:
      case '4':
        current = null;
        login();
        break;
      case 5:
      case '5':
        exit(0);
      default:
        print("Pilihan anda tidak ditemukan.");
        break;
    }
  } while (pilihan != 3);
}

void halamanToko(List<Seller> dataToko) {
  print("${'=' * 5}Halaman Toko${'=' * 5}");
  dataToko.forEach((toko) {
    print("Nama Toko\t\t: ${toko.nama_toko}\n" +
        "Contact Person\t\t: ${toko.no_hp}\n" +
        "Email\t\t\t: ${toko.email}\n" +
        "Barang yang dijual : \n" +
        "Nama barang\t\t: ${toko.barang} \n" +
        "Stok barang\t\t: ${toko.stok} \n" +
        "Harga 1 barang\t\t: Rp.${toko.harga} \n" +
        "=======================\n");
  });
  belanjaBarang(dataToko);
}

void halamanProfile() {
  print("${'=' * 5}Halaman Profile${'=' * 5}");
  print("Nama User\t\t: ${current?.name}\n" +
      "Contact\t\t\t: ${current?.no_hp}\n" +
      "Email\t\t\t: ${current?.email}\n" +
      "Saldo\t\t\t: Rp.${current?.saldo} \n");
}

void belanjaBarang(List<Seller> dataToko) {
  print('Ingin Belanja?(Y/n)');
  var pilihan = stdin.readLineSync()!;
  switch (pilihan) {
    case 'Y':
    case 'y':
      stdout.write("Masukan nama barang : ");
      var namaBarang = stdin.readLineSync()!;
      dataToko.forEach((element) {
        if (namaBarang == element.barang) {
          pesanBarang(element);
        } else {
          print("Nama barang tidak ditemukan");
        }
      });
      break;
    case 'n':
    case 'N':
      menuBelanja(dataToko);
      break;
  }
}

void pesanBarang(Seller toko) {
  print("${'=' * 5}Halaman Pesan${'=' * 5}");
  print("Nama Toko\t\t: ${toko.nama_toko}\n" +
      "Contact Person\t\t: ${toko.no_hp}\n" +
      "Email\t\t\t: ${toko.email}\n" +
      "=======================\n" +
      "Barang yang dijual : \n" +
      "Nama barang\t\t: ${toko.barang} \n" +
      "Stok barang\t\t: ${toko.stok} \n" +
      "Harga 1 barang\t\t: Rp.${toko.harga} \n");
  stdout.write("Beli Sekarang?(Y/n)");
  var pesan = stdin.readLineSync()!;
  switch (pesan) {
    case 'Y':
    case 'y':
      pembayaran(toko);
      break;
    case 'n':
    case 'N':
      menuBelanja(dataToko);
      break;
  }
}

void pembayaran(Seller toko) {
  print("${'=' * 5}Halaman Pembayaran${'=' * 5}");
  print("Saldo Anda\t: ${current!.saldo}");
  print("Harga Barang\t: ${toko.harga}");
  if (current!.saldo > toko.harga) {
    current!.saldo -= toko.harga;
    print("Sisa Saldo anda : ${current!.saldo}");
    menuBelanja(dataToko);
  } else {
    print("Saldo anda tidak cukup, silahkan Isi saldo");
    menuBelanja(dataToko);
  }
}

void tambahSaldo() {
  print("${'=' * 5}Halaman Tambah Saldo${'=' * 5}");
  stdout.write("Masukan Saldo\t: ");
  var saldo = int.tryParse(stdin.readLineSync()!);
  current!.saldo += saldo!;
  print("Saldo Anda : Rp. ${current!.saldo}\n");
  menuBelanja(dataToko);
}
