import 'package:flutter/material.dart';

class Pocket {
  late int? idPocket = null;
  late String namePocket;
  late double pocketBalance;
  late Color colorPocket;

  Pocket(
    this.namePocket,
    this.pocketBalance,
    this.colorPocket,
     this.idPocket
  );

//  int get IdPocket => idPocket!;
  String get NamePocket => namePocket;
  double get PocketBalance => pocketBalance;
  Color get ColorPocket => colorPocket;

  /* Future<void> setIdPocket({
    required int id,
  }) async {
    idPocket = id;
  } */

  Future<void> setNamePocket({
    required String name,
  }) async {
    namePocket = name;
  }

  Future<void> setPocketBalance({
    required String balalce,
  }) async {
    namePocket = balalce;
  }

  Future<void> setColorPocket({
    required String balalce,
  }) async {
    namePocket = balalce;
  }
}
