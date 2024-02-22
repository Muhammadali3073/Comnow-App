import 'dart:ui';

import 'color_data.dart';

class DataFile {
  static List<SubscriptionPackagesModel> subscriptionPackagesModel = [
    SubscriptionPackagesModel(
      "Test Version",
      "3 months",
    ),
  ];

  List<TeamMemberModel> teamMemberList = [
    TeamMemberModel("Mohsin", "Khan", "MOH", CustomColors.greenColor, "Online",
        '1', CustomColors.acceptColor),
    TeamMemberModel("Ali", "Nawaz", "ANB", CustomColors.yellowColor, "Offline",
        '2', CustomColors.declineColor),
    TeamMemberModel("Raza", "Farooq", "RFQ", CustomColors.orangeColor, "Away",
        '3', CustomColors.pendingColor),
    TeamMemberModel("Luqman", "Qasim", "ANB", CustomColors.yellowColor,
        "Online", '4', CustomColors.pendingColor),
    TeamMemberModel("Zeeshan", "Rana", "RFQ", CustomColors.orangeColor, "Away",
        '5', CustomColors.declineColor),
    TeamMemberModel("Ramzan", "Ali", "RNA", CustomColors.blueColor, "Online",
        '6', CustomColors.acceptColor),
  ];

  List<DayByNotificationModel> notificationModelList = [
    DayByNotificationModel("Today", [
      NotificationModel("Ali", 'ping', '23:36 Thu', false),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
    DayByNotificationModel("Yesterday", [
      NotificationModel("Ali", 'ping', '23:36 Thu', true),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
    DayByNotificationModel("11/NOV/2023", [
      NotificationModel("Ali", 'ping', '23:36 Thu', true),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
    DayByNotificationModel("03/NOV/2023", [
      NotificationModel("Ali", 'ping', '23:36 Thu', true),
      NotificationModel("Mohsin", 'text', '23:36 Thu', true),
      NotificationModel("Zeeshan", 'voice', '23:36 Thu', true),
    ]),
  ];
}

/// Subscription Packages Model
class SubscriptionPackagesModel {
  String? name;
  String? duration;

  SubscriptionPackagesModel(this.name, this.duration);
}

/// Member Model
class TeamMemberModel {
  String? firstName;
  String? middleName;
  String? initialName;
  Color? initialBGColor;
  String? type;
  String? uniqueId;
  Color? pingStatus;

  TeamMemberModel(this.firstName, this.middleName, this.initialName,
      this.initialBGColor, this.type, this.uniqueId, this.pingStatus);
}

/// Notification Model
class NotificationModel {
  String? firstName;
  String? type;
  String? timeOfDelivered;
  bool? isView;

  NotificationModel(
    this.firstName,
    this.type,
    this.timeOfDelivered,
    this.isView,
  );
}

/// Notification Model
class DayByNotificationModel {
  String? dateOfDelivered;
  List<NotificationModel>? notificationModel;

  DayByNotificationModel(
    this.dateOfDelivered,
    this.notificationModel,
  );
}
