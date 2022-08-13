import 'dart:io';

import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/model/document_type_model.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/file_model.dart';
import 'package:arsip/data/model/post_document_type_model.dart';
import 'package:arsip/data/model/upload_file_model.dart';
import 'package:arsip/views/main/folder_page.dart';
import 'package:arsip/views/main/search_page.dart';
import 'package:arsip/views/profile/profile_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FileModel> documents = [];
  bool isDocumentsLoaded = false;
  bool isFolderLoaded = false;
  bool isProfileLoaded = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    _getDocuments();
    _getDocumentType();
  }

  void refresh() {
    setState(() {
      documents.clear();
      _getUserInfo();
      _getDocuments();
      _getDocumentType();
    });
  }

  Future<void> _getUserInfo() async {
    await ApiService().getUserInfo().then((value) => {
          usernameController.text = '${value?.username}',
        });
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(() {
        isProfileLoaded = true;
      }),
    );
  }

  Future<void> _getDocuments() async {
    isDocumentsLoaded = false;
    List<DocumentsDataModel>? list;
    await ApiService().getDocuments().then((value) => list = value);
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => list?.forEach(
        (element) {
          if (element.attributes?.documentType?.data == null) {
            documents.add(FileModel(
                element.id!, '${element.attributes?.documentName}', 'file'));
          }
          setState(() {
            isDocumentsLoaded = true;
          });
        },
      ),
    );
  }

  Future<void> _postDocuments(int attachmentId) async {
    String message = 'Success';
    var response =
        await ApiService().postDocuments(nameController.text, attachmentId, null);
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

  Future<void> _uploadFile(String path, String name) async {
    isDocumentsLoaded = false;
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

  Future<void> _getDocumentType() async {
    List<DocumentTypeDataModel>? list;
    await ApiService().getDocumentTypes().then((value) => list = value);
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => list?.forEach(
        (element) {
          documents.add(
              FileModel(element.id!, '${element.attributes?.type}', 'folder'));
          setState(() {
            isFolderLoaded = true;
          });
        },
      ),
    );
  }

  Future<void> _postDocumentType() async {
    isDocumentsLoaded = false;
    String message = 'Success';
    var response = await ApiService().postDocumentTypes(nameController.text);
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

  Future<void> _updateDocumentType(int id) async {
    String message = 'Success';
    var response =
        await ApiService().updateDocumentTypes(nameController.text, id);
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

  Future<void> _deleteDocumentType(int id) async {
    String message = 'Success';
    var response = await ApiService().deleteDocumentTypes(id);
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
      createTextInputDialog('file', file);
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
                  Navigator.pop(context);
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
                  if (file.type == 'folder') {
                    _updateDocumentType(file.id);
                    Navigator.pop(context);
                  } else {
                    _updateDocuments(file.id);
                    Navigator.pop(context);
                  }
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

  Future<void> createTextInputDialog(String type, File? file) async {
    nameController.text = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: type == 'folder'
              ? const Text('Create Folder')
              : const Text('Create File'),
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
                Navigator.pop(context);
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
                  if (type == 'folder') {
                    _postDocumentType();
                  } else {
                    _uploadFile('${file?.path}', nameController.text);
                  }
                  Navigator.pop(context);
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
                  if (file.type == 'folder') {
                    _deleteDocumentType(file.id);
                  } else {
                    _deleteDocuments(file.id);
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void documentOptions(FileModel file, String type) {
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
                  Navigator.pop(context);
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

  void choseDocumentTypeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('What to add?'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    createTextInputDialog('folder', null);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.folder,
                        color: Colors.amber.shade900,
                      ),
                      Text(
                        'Folder',
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
                    getFile();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file,
                        color: Colors.amber.shade900,
                      ),
                      Text(
                        'File',
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
                  Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    documents.sort(
      (a, b) {
        var first = a.name;
        var second = b.name;
        return first.compareTo(second);
      },
    );
    documents.sort(
      (a, b) {
        var first = a.type;
        var second = b.type;
        return second.compareTo(first);
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 18,
                child: CircleAvatar(
                  backgroundColor: Colors.amber.shade900,
                  maxRadius: 16,
                  child: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  usernameController.text,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
      body: (isDocumentsLoaded && isFolderLoaded && isProfileLoaded)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                                  '/Home',
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
                          onTap: choseDocumentTypeDialog,
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
                            onTap: () {
                              documents[index].type == 'folder'
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FolderPage(
                                          model: documents[index],
                                        ),
                                      ),
                                    )
                                  : Navigator;
                            },
                            onLongPress: () {
                              documentOptions(
                                  documents[index], documents[index].type);
                            },
                            child: Column(
                              children: [
                                documents[index].type == 'folder'
                                    ? Icon(
                                        Icons.folder,
                                        color: Colors.amber.shade900,
                                        size: 50,
                                      )
                                    : Icon(
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
            )
          : Center(
              child: CircularProgressIndicator(
                color: Colors.amber.shade900,
              ),
            ),
    );
  }
}
