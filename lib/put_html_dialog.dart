import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PutHtmlDialog extends StatefulWidget {
  const PutHtmlDialog({super.key});

  @override
  State<PutHtmlDialog> createState() => _PutHtmlDialogState();
}

class _PutHtmlDialogState extends State<PutHtmlDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(),
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.back(result: "<html><head><title>Page Title</title></head><style>.video-main{width: 411px;height: 200px;overflow:hidden ;}video.tempVideo {width: 100%;}</style><body><div class='video-main'><video class='tempVideo'  poster=linkOfImage  controls  src=linkOfVideo'></video></div></body></html>");
            }, child: const Text("Insert Html"))
          ],
        ),
      ),
    );
  }
}
