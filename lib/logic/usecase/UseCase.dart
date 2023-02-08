import 'dart:math';

import 'package:trmi_eltoque_front/logic/domain/Domain.dart';

class UseCase {
  Random rm = Random();

  Future<Domain> fetch() async {
    return Future.delayed(
      Duration(
        seconds: rm.nextInt(2) + 1,
      ),
      () => Domain(
          usd: random(), eur: random(), mlc: random(), lastUpdatedAt: "???"),
    );
  }

  String random() {
    return "${rm.nextInt(100) + 100}";
  }
}
