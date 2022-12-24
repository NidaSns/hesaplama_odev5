import 'package:flutter/material.dart';
import 'package:hesapmakinesi_odev/row_component.dart';
import 'package:hesapmakinesi_odev/tus_component.dart';

enum tiklandi { arti, esittir, rakam, sumRakam }

class Keyboard extends StatefulWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  int value = 0;
  int eklenenDeger = 0;
  String girilenDeger = "";
  String toplananDeger = "";
  String sonuc = "";
  var tiklananTus = tiklandi.rakam;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keyboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                height: height / 10,
                width: width / 1.1,
                child: ListTile(
                  title: Text(
                    (tiklananTus == tiklandi.arti ||
                            tiklananTus == tiklandi.sumRakam ||
                            tiklananTus == tiklandi.esittir)
                        ? girilenDeger
                        : girilenDeger =
                            int.parse(girilenDeger += value.toString())
                                .toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 30),
                  ),
                  subtitle: Text(
                    (tiklananTus == tiklandi.arti)
                        ? toplananDeger
                        : toplananDeger =
                            int.parse(toplananDeger += eklenenDeger.toString())
                                .toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: height / 1.7,
                width: width / 1.1,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RowComponent(
                      value1: "1",
                      value2: "2",
                      value3: "3",
                      onPress1: () {
                        setState(() {
                          rakamTiklama(1);
                        });
                      },
                      onPress2: () {
                        setState(() {
                          rakamTiklama(2);
                        });
                      },
                      onPress3: () {
                        setState(() {
                          rakamTiklama(3);
                        });
                      },
                    ),
                    RowComponent(
                      value1: "4",
                      value2: "5",
                      value3: "6",
                      onPress1: () {
                        setState(() {
                          rakamTiklama(4);
                        });
                      },
                      onPress2: () {
                        setState(() {
                          rakamTiklama(5);
                        });
                      },
                      onPress3: () {
                        setState(() {
                          rakamTiklama(6);
                        });
                      },
                    ),
                    RowComponent(
                      value1: "7",
                      value2: "8",
                      value3: "9",
                      onPress1: () {
                        setState(() {
                          rakamTiklama(7);
                        });
                      },
                      onPress2: () {
                        setState(() {
                          rakamTiklama(8);
                        });
                      },
                      onPress3: () {
                        setState(() {
                          rakamTiklama(9);
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height / 10,
                          width: width / 4.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            color: Colors.grey,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                value = int.parse(girilenDeger) +
                                    int.parse(toplananDeger);
                                tiklananTus = tiklandi.esittir;
                                eklenenDeger = int.parse(toplananDeger);
                                toplananDeger = "";
                                girilenDeger = value.toString();
                              });
                            },
                            child: const Text("="),
                          ),
                        ),
                        TusComponent(
                          value: "0",
                          onPress: () {
                            setState(() {
                              rakamTiklama(0);
                            });
                          },
                        ),
                        Container(
                          height: height / 10,
                          width: width / 4.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            color: Colors.grey,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (tiklananTus == tiklandi.esittir) {
                                  tiklananTus = tiklandi.arti;
                                  value = int.parse(girilenDeger);
                                  eklenenDeger = value;
                                  toplananDeger = "";
                                  girilenDeger = value.toString();
                                } else if (tiklananTus == tiklandi.rakam ||
                                    tiklananTus == tiklandi.sumRakam) {
                                  tiklananTus = tiklandi.arti;
                                  value = int.parse(girilenDeger) +
                                      int.parse(toplananDeger);
                                  eklenenDeger = value;
                                  toplananDeger = value.toString();
                                  girilenDeger = value.toString();
                                } else {}
                              });
                            },
                            child: const Text("+"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    value = 0;
                    eklenenDeger = 0;
                    girilenDeger = "0";
                    tiklananTus = tiklandi.rakam;
                    toplananDeger = "";
                  });
                },
                child: const Text("Sıfırla"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void rakamTiklama(int deger) {
    if (tiklananTus == tiklandi.arti) {
      eklenenDeger = deger;
      toplananDeger = "";
      tiklananTus = tiklandi.sumRakam;
    } else if (tiklananTus == tiklandi.esittir) {
      tiklananTus = tiklandi.rakam;
      value = 0;
      eklenenDeger = 0;
      girilenDeger = "";
      toplananDeger = "";
      value = deger;
    } else if (tiklananTus == tiklandi.sumRakam) {
    } else {
      value = deger;
      tiklananTus = tiklandi.rakam;
    }
  }
}
