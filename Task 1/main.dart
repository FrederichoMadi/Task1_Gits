import 'dart:io';

class User {
  String nama;
  int password;
  int saldo;
  String no_rek;

  User(
      {required this.nama,
      required this.password,
      required this.saldo,
      required this.no_rek});

  String getNama() => nama;
  int getPassword() => password;
  int getSaldo() => saldo;
  String getNoRek() => no_rek;
}

void main() {
  User akun1 = new User(
      nama: 'Andi', password: 123456, saldo: 100000, no_rek: "987654321");

  User akun2 = new User(
      nama: 'Budi', password: 112233, saldo: 100000, no_rek: "123456789");

  print("=================== Selamat Datang di ATM =====================");
  stdout.write('Masukan password anda (terdiri dari 6 angka) : ');
  var password = int.parse(stdin.readLineSync()!);
  print("========================================");
  if (password == akun1.password) {
    menuAtm(akun1, akun2);
  } else if (password == akun2.password) {
    menuAtm(akun2, akun1);
  } else {
    print('password anda salah!');
    print("======================================== \n");
  }
}

void menuAtm(User userLogin, User userLain) {
  var pilihan;
  String rekening;
  int tarifTransfer;
  int penarikan;
  int setoran;

  do {
    print('====== Menu ATM ======');
    print('1. Transfer');
    print('2. Penarikan Tunai');
    print('3. Setoran Tunai');
    print('4. Lihat Saldo');
    print('5. Keluar');
    stdout.write('Masukan pilihan:');
    pilihan = int.parse(stdin.readLineSync()!);
    switch (pilihan) {
      case 1:
        print("========================================");
        stdout.write('Masukan nomor rekening : ');
        rekening = stdin.readLineSync()!;
        if (rekening == userLain.no_rek) {
          print("========================================");
          stdout.write('Nominal yang di transfer : ');
          tarifTransfer = int.parse(stdin.readLineSync()!);
          print("======================================== ");
          print('Nama Tujuan rekening \t\t: ${userLain.nama}');
          print('No Rekening Tujuan \t\t: ${userLain.no_rek}');
          print('Nominal yang ditransfer \t: Rp. $tarifTransfer');
          stdout.write('Lanjutkan (Y/n)? ');
          var keputusan = stdin.readLineSync()!;
          switch (keputusan) {
            case 'Y':
            case 'y':
              //perhitungan saldo
              if (userLogin.saldo > tarifTransfer) {
                userLogin.saldo -= tarifTransfer;
                userLain.saldo += tarifTransfer;
                print("========================================");
                print('Transaksi anda berhasil!');

                print("======================================== \n");
              } else {
                print("========================================");
                print('Jumlah saldo anda tidak cukup');
                print("======================================== \n");
              }
              break;
            case 'N':
            case 'n':
              print("========================================");
              print('Transaksi dibatalkan!');
              print("======================================== \n");
              break;
          }
        } else {
          print("========================================");
          print('Nomor Rekening yang anda masukan salah');
          print("======================================== \n");
        }
        break;
      case 2:
        print("========================================");
        stdout.write('Masukan nominal penarikan : ');
        penarikan = int.parse(stdin.readLineSync()!);
        if (userLogin.saldo > penarikan) {
          userLogin.saldo -= penarikan;
          print("========================================");
          print('Sisa saldo anda : ${userLogin.saldo}');
          print("======================================== \n");
        } else {
          print("========================================");
          print('Sisa saldo anda tidak mencukupi');
          print("======================================== \n");
        }
        break;
      case 3:
        print("========================================");
        stdout.write('Masukan nominal setoran : ');
        setoran = int.parse(stdin.readLineSync()!);
        userLogin.saldo += setoran;
        print("========================================");
        print('Saldo anda : ${userLogin.saldo}');
        print("======================================== \n");
        break;
      case 4:
        print("========================================");
        print("Saldo di rekening anda : Rp. ${userLogin.saldo}");
        print("======================================== \n");
        break;
      case 5:
        print("========================================");
        print('Terima kasih, silahkan kembali :D');
        print("======================================== \n");
        break;
      default:
        print('Angka yang anda masukan salah');
        break;
    }
  } while (pilihan != 5);
}
