import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un simple boleano
final isDarkModeProvider = StateProvider((ref) => false);

// Un simple entero
final selectedColorProvider = StateProvider((ref) => 0);