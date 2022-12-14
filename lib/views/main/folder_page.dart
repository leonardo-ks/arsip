import 'dart:io';

import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/model/file_model.dart';
import 'package:arsip/data/model/folder_model.dart';
import 'package:arsip/data/model/post_document_type_model.dart';
import 'package:arsip/data/model/upload_file_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FolderPage extends StatefulWidget {
  final FileModel model;
  const FolderPage({Key? key, required this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  List<FileModel> documents = [];
  bool isFolderLoaded = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getDocumentTypeById();
  }

  void refresh() {
    documents.clear();
    _getDocumentTypeById();
  }

  Future<void> _getDocumentTypeById() async {
    List<FolderDataAttributesDocumentsDataModel>? list;
    await ApiService().getDocumentTypesById(widget.model.id).then((value) => {
          if (value?.isNotEmpty == true)
            {list = value}
          else
            {
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Folder is empty',
                    ),
                  ),
                );
                isFolderLoaded = true;
              })
            }
        });
    Future.delayed(const Duration(seconds: 1)).then((value) => {
          list?.forEach(
            (element) {
              documents.add(
                  FileModel(element.id!, '${element.attributes?.documentName}', 'file'));
              setState(() {
                isFolderLoaded = true;
              });
            },
          ),
        });
  }

  Future<void> _postDocuments(int attachmentId) async {
    String message = 'Success';
    var response = await ApiService()
        .postDocuments(nameController.text, attachmentId, widget.model.id);
    if (response.runtimeType != PostDocumentTypeDataAttributesModel) {
      message = response.message;
    }
    Future.delayed(const Duration(seconds: 1)).then((value) => {
          refresh(),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
              ),
            ),
          ),
        });
  }

  Future<void> _updateDocuments(int id) async {
    String message = 'Success';
    var response = await ApiService().updateDocuments(nameController.text, id);
    if (response.runtimeType != PostDocumentTypeDataAttributesModel) {
      message = response.message;
    }
    Future.delayed(const Duration(seconds: 1)).then((value) => {
          refresh(),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
              ),
            ),
          ),
        });
  }

  Future<void> _deleteDocuments(int id) async {
    String message = 'Success';
    var response = await ApiService().deleteDocuments(id);
    if (response.runtimeType != PostDocumentTypeDataAttributesModel) {
      message = response.message;
    }
    Future.delayed(const Duration(seconds: 1)).then((value) => {
          refresh(),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
              ),
            ),
          ),
        });
  }

  Future getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File('${result.files.single.path}');
      createTextInputDialog(file);
    }
  }

  Future<void> renameTextInputDialog(FileModel file) async {
    nameController.text = file.name;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Rename ${file.name}'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Name"),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _updateDocuments(file.id);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Rename',
                    style: TextStyle(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<void> createTextInputDialog(File? file) async {
    nameController.text = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create File'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.amber.shade900,
                  ),
                ),
                onPressed: () {
                  _uploadFile('${file?.path}', nameController.text);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteDocumentDialog(FileModel file) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Delete ${file.name}?'),
          content: Text('Do you want to delete ${file.name}?'),
          actions: [
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amber.shade900),
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _deleteDocuments(file.id);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _uploadFile(String path, String name) async {
    isFolderLoaded = false;
    await ApiService().uploadFiles(path, name).then(
          (value) => {
            if (value.runtimeType == UploadFileModel)
              {
                _postDocuments(value.id),
              }
            else
              {
                Future.delayed(const Duration(seconds: 1)).then(
                  (a) => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          value.message,
                        ),
                      ),
                    ),
                  },
                ),
              }
          },
        );
  }

  void documentOptions(FileModel file) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: Column(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    renameTextInputDialog(file);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.drive_file_rename_outline,
                        color: Colors.amber.shade900,
                      ),
                      Text(
                        'Rename',
                        style: TextStyle(
                          color: Colors.amber.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    deleteDocumentDialog(file);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.amber.shade900,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.amber.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  'Cancel',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Type a name'),
            content: TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (isFolderLoaded) {
      documents.sort(
        (a, b) {
          var first = a.name;
          var second = b.name;
          return first.compareTo(second);
        },
      );
      return Scaffold(
        resizeToAvoidBottomInset: false,
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
                    InkWell(
                      onTap: getFile,
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.amber.shade900,
                        size: 32,
                      ),
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
                      return InkWell(
                        onLongPress: () {
                          documentOptions(documents[index]);
                        },
                        child: Column(
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
                        ),
                      );
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
