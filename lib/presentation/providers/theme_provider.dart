import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un simple boleano
final isDarkModeProvider = StateProvider((ref) => false);

// Un simple entero
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo Apptheme (Custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controlle o Notifier
class ThemeNotifier extends  StateNotifier<AppTheme>{
  ThemeNotifier(): super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  void chageColorIndex(int colorIndex){
    state = state.copyWith( selectedColor: colorIndex);
  }
}