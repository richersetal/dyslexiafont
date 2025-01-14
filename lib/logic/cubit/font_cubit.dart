import 'package:bloc/bloc.dart';

class FontCubit extends Cubit<String?> {
  /// Default is `null`, by default the standard font of Flutter is used
  FontCubit() : super(null);

  /// changefont to given value
  /// If`null` default font is used
  void changeFont(String? font) {
    emit(font);
  }
}
