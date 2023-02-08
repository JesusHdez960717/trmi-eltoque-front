import 'package:trmi_eltoque_front/trmi_exporter.dart';

abstract class TrmiState {
  const TrmiState();
}

class TrmiInitialState extends TrmiState {
  final String message = "Actualiza por primera vez";

  const TrmiInitialState();}

class TrmiFetchingState extends TrmiState {
  final String message = "Cargando tasas";

  const TrmiFetchingState();
}

class TrmiFetchSuccessState extends TrmiState {
  final Domain domain;

  const TrmiFetchSuccessState({
    required this.domain,
  });
}

class TrmiFetchErrorState extends TrmiState {
  final String errorMessage;

  const TrmiFetchErrorState({
    required this.errorMessage,
  });
}
