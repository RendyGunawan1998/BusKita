import 'dart:io';

import 'package:buskita/core.dart';

class ChatBus extends StatefulWidget {
  const ChatBus({Key key}) : super(key: key);

  @override
  _ChatBusState createState() => _ChatBusState();
}

class _ChatBusState extends State<ChatBus> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarPenumpang('Chat', () {
        Get.back();
      }),
      body: Tawk(
          directChatLink:
              'https://tawk.to/chat/63fae16d4247f20fefe2acda/1gq6015c5'),
      //  WebView(
      //   initialUrl: 'https://bus.bgs-erp.com/',
      // ),
    );
  }
}
