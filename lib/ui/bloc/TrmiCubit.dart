import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trmi_eltoque_front/trmi_exporter.dart';

class TrmiCubit extends Cubit<TrmiState> {
  final UseCase _uc = UseCase();

  TrmiCubit() : super(TrmiInitialState());

  void update() async {
    emit(
      const TrmiFetchingState(),
    );

    Domain doamin = await _uc.fetch();
    emit(
      TrmiFetchSuccessState(
        domain: doamin,
      ),
    );
  }
}
