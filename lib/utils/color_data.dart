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
Color textFormFieldHintColor = "#C1C1C1".toColor();
Color tabBarColor = "#1B1B1B".toColor();
Color tabBarTextColor = "#7D7D7D".toColor();
Color activeTabBarColor = "#F5F5F5".toColor();
Color dialogBoxColor = "#292929".toColor();
Color popupMenuColor = "#292929".toColor();
Color toastColor = "#464646".toColor();
Color acceptColor = "#AF2C2D".toColor();
Color declineColor = "#D2BD07".toColor();
Color pendingColor = "#1E7409".toColor();
Color voiceNoteColor = "#969696".toColor();
Color redColor = "#EA2A2A".toColor();
Color orangeColor = "#E4951F".toColor();
Color yellowColor = "#E4DC1F".toColor();
Color greenColor = "#46E41F".toColor();
Color skyBlueColor = "#1FE4C1".toColor();
Color blueColor = "#218FF5".toColor();
Color darkBlueColor = "#2F1FE4".toColor();
Color purpleColor = "#C81FE4".toColor();
Color pinkColor = "#E41FA1".toColor();
Color leftMemberBGColor = "#C3C3C3".toColor();
Color leftMemberBGCardColor = "#858585".toColor();
Color lightGreenCardColor = "#ADE903".toColor();
Color settingTitleBGColor = "#4E4E4E".toColor();

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
