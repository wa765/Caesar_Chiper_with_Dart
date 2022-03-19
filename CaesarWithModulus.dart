import 'dart:io';

void main(List<String> args) {
  print("---------------------- 1 . Enskripsi ---------------------- ");
  print("---------------------- 2 . Deskripsi ---------------------- ");
  print("---------------------- 3 .  Keluar   ---------------------- ");
  print(Menu());
}

//
dynamic Menu() {
  stdout.write("Mau coba ? ");
  String pilihan = stdin.readLineSync()!;

  // Yes
  while (pilihan == "y" || pilihan == "Y" || pilihan == "ya") {
    stdout.write("Program apa nihh ? ");
    String chooseProgram = stdin.readLineSync()!;
    if (chooseProgram == "1") {
      return CaesarEnkripsi();
    } else if (chooseProgram == "2") {
      return CaesarDeskripsi();
    } else if (chooseProgram == "3") {
      return "Terima Kasih";
    } else {
      return "Anda Ngantuk ?";
    }
  }

  // No
  while (pilihan == "t" || pilihan == "T" || pilihan == "Tidak") {
    return "OKEE TERIMA KASIH";
  }
}

//
String CaesarEnkripsi() {
  print("Fitur Enkripsi");
  stdout.write("Masukkan String : ");
  String str = stdin.readLineSync()!;
  stdout.write("Masukkan Key : ");
  int number = int.parse(stdin.readLineSync()!);

  // Enskripsi
  number = number % 26;
  var lowerCaseString = str.toLowerCase();
  var abjad = 'abcdefghijklmnopqrstuvwxyz'.split("");
  var newString = '';
  //
  for (var i = 0; i < lowerCaseString.length; i++) {
    var CurrentLetter = lowerCaseString[i];
    if (CurrentLetter == " ") {
      newString += CurrentLetter;
      continue;
    }
    var currentIndex = abjad.indexOf(CurrentLetter);
    //
    var newIndex = currentIndex + number;
    //
    if (newIndex > 25) newIndex = newIndex - 26;
    //
    if (newIndex < 0) newIndex = 26 + newIndex;
    //
    if (str[i] == str[i].toUpperCase()) {
      newString += abjad[newIndex].toUpperCase();
    } else {
      newString += abjad[newIndex];
    }
  }
  return "Hasil : ${newString}";
}

String CaesarDeskripsi() {
  print("Fitur Deskripsi");
  stdout.write("Masukkan String : ");
  String str = stdin.readLineSync()!;
  stdout.write("Masukkan Key : ");
  int number = int.parse(stdin.readLineSync()!);
  // Deskripsi
  number = number % 26;
  var lowerCaseString = str.toLowerCase();
  var abjad = 'abcdefghijklmnopqrstuvwxyz'.split("");
  var newString = '';
  //
  for (var i = 0; i < lowerCaseString.length; i++) {
    var CurrentLetter = lowerCaseString[i];
    if (CurrentLetter == " ") {
      newString += CurrentLetter;
      continue;
    }
    var currentIndex = abjad.indexOf(CurrentLetter);
    //
    var newIndex = currentIndex - number;
    //
    if (newIndex > 25) newIndex = newIndex - 26;
    //
    if (newIndex < 0) newIndex = 26 + newIndex;
    //
    if (str[i] == str[i].toUpperCase()) {
      newString += abjad[newIndex].toUpperCase();
    } else {
      newString += abjad[newIndex];
    }
  }
  return "Hasil : ${newString}";
}
