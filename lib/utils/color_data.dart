import 'dart:ui';

Color topBackgroundColor = "#121212".toColor();
Color bottomBackgroundColor = "#1E1F1D".toColor();
Color topButtonColor = "#696969".toColor();
Color bottomButtonColor = "#0A0A0A".toColor();
Color titleWhiteTextColor = "#FFFFFF".toColor();
Color titleBlackTextColor = "#050505".toColor();
Color whiteButtonColor = "#FFFFFF".toColor();
Color blueButtonColor = "#0E9AFF".toColor();
Color selectUserCardBackgroundColor = "#FFFFFF".toColor();
Color textFormFieldBackgroundColor = "#3A3A3A".toColor();
Color hintColor = "#C1C1C1".toColor();
Color blueTextColor = "#0E9AFF".toColor();
Color textFormFieldBGColor = "#3A3A3A".toColor();
Color textFormFieldHintColor = "#C1C1C1".toColor();
Color tabBarColor = "#1B1B1B".toColor();
Color tabBarTextColor = "#7D7D7D".toColor();





extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
