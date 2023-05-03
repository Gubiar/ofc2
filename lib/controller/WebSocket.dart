import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocket extends GetxController {
  static final wsUrl = Uri.parse('ws://localhost:1234');
  static var channel;

  static Future<void> setup() async {
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      channel.sink.add('received!');
      channel.sink.close(status.goingAway);
    });
  }

}