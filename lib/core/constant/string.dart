const String appVersion = '1.2.4';
const String int_appVersion = '1.2.4';
const String appLinkIos = "https://apps.apple.com/us/app/empower2025/id6751444283";
const String appLinkAndroid = "https://play.google.com/store/apps/details?id=com.empower.empower25";
const String resourcetitle ='Step into the Vault Of Scrolls - a repository of previous year question papers from Year I to IV, carefully curated to help students gain knowledge, prepare better, and excel in their exams.';

class AppTitles{
  static const String HomeTitle ='Home';
  static const String MacTitle ='Machine List';
}

class ErrorValues{
 static const String nomachine ='No machine found';
}

class stringArray{
  final List<Map<String, String>> eventCategories = [
    {
      "title": "Workshop",
      "image": "http://13.234.251.159:8082/Page_Icon/01.png",
    },
    {
      "title": "Quiz",
      "image": "http://13.234.251.159:8082/Page_Icon/02.png",
    },
    {
      "title": "Presentations",
      "image": "http://13.234.251.159:8082/Page_Icon/03.png",
    },
    {
      "title": "Symposium",
      "image": "http://13.234.251.159:8082/Page_Icon/04.png",
    },
    {
      "title": "Inventio",
      "image": "http://13.234.251.159:8082/Page_Icon/05.png",
    },
    {
      "title": "Literary Events",
      "image": "http://13.234.251.159:8082/Page_Icon/06.png",
    },
    {
      "title": "Online Events",
      "image": "http://13.234.251.159:8082/Page_Icon/10.png",
    },
    {
      "title": "CSI",
      "image": "http://13.234.251.159:8082/Page_Icon/09.png",
    },
    {
      "title": "Food & Accommodation",
      "image": "http://13.234.251.159:8082/Page_Icon/08.png",
    },
    {
      "title": "Event Schedule",
      "image": "http://13.234.251.159:8082/Page_Icon/07.png",
    },
    {
      "title": "Resource",
      "image": "http://13.234.251.159:8082/Page_Icon/11.png",
    },
  ];
}

class eventarray{

  static const Map<String, String> typeMap = {
    "Workshop": "1",
    "Presentations": "6",
    "Symposium": "3",
    "Quiz": "2",
    "Literary Events": "4",
    "Online Events": "7",
    "CSI": "8",
  };
}

String getStatusText(String status) {
  switch (status) {
    case "0":
      return "Rejected";
    case "1":
      return "Selected";
    case "2":
      return "Pending";
    default:
      return "Unknown";
  }
}

