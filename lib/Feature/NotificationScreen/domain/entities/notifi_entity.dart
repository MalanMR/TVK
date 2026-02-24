class NotifiEntity {
  int jsonStatus;
  String msg;
  List<NotifiData> data;

  NotifiEntity({
    required this.jsonStatus,
    required this.msg,
    required this.data,
  });

}

class NotifiData {
  String n;
  String t;

  NotifiData({
    required this.n,
    required this.t,
  });

}
