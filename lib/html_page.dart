import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:get/get.dart';
import 'package:html_sample/put_html_dialog.dart';

class HtmlPage extends StatefulWidget {
  const HtmlPage({super.key});

  @override
  State<HtmlPage> createState() => _HtmlPageState();
}

class _HtmlPageState extends State<HtmlPage> {
  HtmlEditorController htmlEditorController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: /*HtmlEditor(
        controller: htmlEditorController,
        htmlToolbarOptions: HtmlToolbarOptions(
            defaultToolbarButtons: getDefaultToolbar(),

            onButtonPressed:
            (ButtonType type, bool? status, Function? updateStatus) async {
          if (type == ButtonType.video) {
            String data = await Get.dialog(const PutHtmlDialog());
            debugPrint("#################");
            debugPrint("Received HTML data: $data");

            if (data != null) {
              debugPrint("Inserting HTML data into editor: $data");
              htmlEditorController.insertHtml(data);
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(data.toString())));
            }
          }
          return false;
        }),
      )*/HtmlEditor(
        controller: htmlEditorController,
        htmlEditorOptions: HtmlEditorOptions(
          hint: "Html",
          shouldEnsureVisible: false,
          initialText: "Hello",
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          defaultToolbarButtons:
          getDefaultToolbar(),
          /*customToolbarButtons: [
                        //your widgets here
                        IconButton(
                          onPressed: () async{
                            String data = await Get.dialog(
                                FileDialog(highlightedHtmlEditorController, 2));
                            myDebugPrint("#################");
                            myDebugPrint("Received HTML data: $data");
                            highlightedHtmlEditorController.insertHtml(data);
                              if (data != null) {
                            myDebugPrint("Inserting HTML data into editor: $data");
                            highlightedHtmlEditorController.insertHtml(data);
                            controller.update();
                          } else {
                            showSnakeBar(message: data.toString());
                          }
                          },
                          icon:const Icon(Icons.image,
                            color: Colors.amber,
                            size: 26)
                        )
                      ],*/
          toolbarPosition:
               ToolbarPosition.aboveEditor
             ,
          //by defaul
          toolbarType: ToolbarType.nativeGrid,
          gridViewHorizontalSpacing: 5,
          gridViewVerticalSpacing: 0,
          //by default
          onButtonPressed: (ButtonType type, bool? status,
              Function? updateStatus) async {
            if (type == ButtonType.picture) {

              return false; //this tells the plugin we handled image in a custom way
            }
            if (type == ButtonType.video) {
              String data = await Get.dialog(
                  PutHtmlDialog());
              debugPrint("#################");
              debugPrint("Received HTML data: $data");
              htmlEditorController.insertHtml(data);

              /*  if (data != null) {
                            myDebugPrint("Inserting HTML data into editor: $data");
                            highlightedHtmlEditorController.insertHtml(data);
                            controller.update();
                          } else {
                            showSnakeBar(message: data.toString());
                          }*/
              return false; //this tells the plugin we handled image in a custom way
            }
            if (type == ButtonType.audio) {

              return false; //this tells the plugin we handled image in a custom way
            }
            if (type == ButtonType.link) {

              return false; //this tells the plugin we handled image in a custom way
            }
            return true;
          },
          onDropdownChanged: (DropdownType type, dynamic changed,
              Function(dynamic)? updateSelectedItem) {
            return true;
          },
          mediaLinkInsertInterceptor:
              (String url, InsertFileType type) {
            return true;
          },

        ),
        otherOptions: OtherOptions(height: 1000),
        callbacks: Callbacks(
          onBeforeCommand: (String? currentHtml) {},
          onChangeContent: (String? changed) {
          },
          onChangeCodeview: (String? changed) {
            print("changed$changed");
          },
          onChangeSelection: (EditorSettings settings) {},
        ),
      ),
    );
  }
  getDefaultToolbar() {
    return [
      const StyleButtons(),
      const FontSettingButtons(fontSizeUnit: false),
      const FontButtons(
          strikethrough: false, superscript: false, subscript: false),
      const ColorButtons(highlightColor: false),
      const ListButtons(listStyles: false),
      const InsertButtons(hr: false),
      const ParagraphButtons(
          decreaseIndent: false,
          increaseIndent: false,
          lineHeight: true,
          textDirection: false,
          caseConverter: false),
      const OtherButtons(
          codeview: false,
          help: false,
          copy: false,
          paste: true,
          fullscreen: false)
    ];
  }
}
