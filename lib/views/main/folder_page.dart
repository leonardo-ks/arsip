import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/file_model.dart';
import 'package:flutter/material.dart';

class FolderPage extends StatefulWidget {
  final FileModel model;
  const FolderPage({Key? key, required this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  List<FileModel> documents = [];
  bool isDocumentsLoaded = false;
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getDocuments();
  }

  Future<void> _getDocuments() async {
    List<DocumentsDataModel>? list;
    await ApiService().getDocuments().then((value) => list = value);
    Future.delayed(const Duration(seconds: 1)).then(
          (value) => list?.forEach(
            (element) {
          if (element.attributes?.documentType?.data == null) {
            documents
                .add(FileModel(0, '${element.attributes?.documentName}', 'file'));
          }
          setState(() {
            isDocumentsLoaded = true;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isDocumentsLoaded) {
      documents.sort(
            (a, b) {
          var first = a.name;
          var second = b.name;
          return first.compareTo(second);
        },
      );
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade900,
          title: Text(widget.model.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.amber.shade900,
                            size: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '/Home/${widget.model.name}',
                              style: TextStyle(
                                color: Colors.amber.shade900,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.amber.shade900,
                      size: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GridView.builder(
                    itemCount: documents.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, int index) {
                      if (documents[index].type == 'folder') {
                        return Column(
                          children: [
                            Icon(
                              Icons.folder,
                              color: Colors.amber.shade900,
                              size: 50,
                            ),
                            Text(
                              documents[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Icon(
                              Icons.insert_drive_file,
                              color: Colors.amber.shade900,
                              size: 50,
                            ),
                            Text(
                              documents[index].name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade900,
          title: Text(widget.model.name),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.amber.shade900,
          ),
        ),
      );
    }
  }
}
