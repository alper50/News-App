import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  int index;

  @override
  Widget build(BuildContext context) {
    final Map argmnts = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            argmnts["source"],
          ),
        ),
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.cancel_outlined),
        ),
        actions: [
          NavigationControls(_completer.future, argmnts["newsUrl"]),
        ],
      ),
      body: IndexedStack(index: index, children: [
        WebView(
          initialUrl: argmnts["newsUrl"],
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
          onPageStarted: (_) {
            setState(() {
              index = 1;
            });
          },
          onPageFinished: (_) {
            setState(() {
              index = 0;
            });
          },
        ),
        Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ]),
    );
  }
}

class NavigationControls extends StatefulWidget {
  const NavigationControls(this._webViewControllerFuture, this.newsurl)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;
  final String newsurl;

  @override
  _NavigationControlsState createState() => _NavigationControlsState();
}

class _NavigationControlsState extends State<NavigationControls> {
  @override
  Widget build(BuildContext context) {
    PersistentBottomSheetController _bottomcontroller; //bottom sheet için bir controller aç kapa yapmak için ama çalışmadı
    bool isopen = false;
    return FutureBuilder<WebViewController>(
      future: widget._webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return IconButton(
          icon: Icon(Icons.keyboard_control_rounded),
          onPressed: () {
            isopen == true
                ? _bottomcontroller.close()
                : _bottomcontroller =showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Wrap(
                          spacing: 5,
                          children: [
                            ListTile(
                              title: Text("Sayfayı yenile"),
                              trailing: Icon(Icons.refresh),
                              onTap: !webViewReady
                                  ? null
                                  : () {
                                      controller.reload();
                                    },
                            ),
                            ListTile(
                              onTap: () {
                                Clipboard.setData(
                                  new ClipboardData(
                                    text: widget.newsurl,
                                  ),
                                ).then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          const Text('Bağlantı Kopyalandı'),
                                    ),
                                  );
                                });
                              },
                              title: Text("Bağlantıyı kopyala"),
                              trailing: Icon(
                                Icons.insert_link_rounded,
                              ),
                            )
                          ],
                        ),
                      );
                    });
            setState(() {
              isopen = !isopen;
            });
          },
        );
      },
    );
  }
}
