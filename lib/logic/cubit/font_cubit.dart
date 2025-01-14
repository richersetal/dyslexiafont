import 'package:bloc/bloc.dart';

class FontCubit extends Cubit<String?> {
  /// Default is `null`, by default the standard font of Flutter is used
  FontCubit() : super(null);

  /// Wijzigt het lettertype naar de opgegeven waarde
  /// Als er `null` wordt meegegeven, wordt het standaard Flutter-lettertype gebruikt
  void changeFont(String? font) {
    emit(font);
  }
}
