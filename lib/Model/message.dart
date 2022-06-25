// ignore_for_file: prefer_initializing_formals, empty_constructor_bodies, unnecessary_this

class MessageModel {
  String? text, sender, date, reciever, time;
  MessageModel();
  MessageModel.data(
      {required this.sender,
      required this.reciever,
      required this.date,
      required this.text,
      required this.time});

  // ignore: non_constant_identifier_names
  MessageModel.get_data(Map<String, dynamic>? json) {
    if (json != null) {
      text = json['text'];
      sender = json['sender'];
      reciever = json['reciever'];
      date = json['date'];
      time = json['time'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'date': date,
      'time': time,
      'sender': sender,
      'reciever': reciever,
    };
  }
}
