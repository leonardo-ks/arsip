import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/model/document_type_model.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/file_model.dart';
import 'package:arsip/data/model/post_document_type_model.dart';
import 'package:arsip/views/main/folder_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<FileModel> documents = [];
  List<FileModel> filteredDocuments = [];
  bool isDocumentsLoaded = false;
  bool isFolderLoaded = false;
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getDocumentType();
    _getDocuments();
  }

  void refresh() {
    documents.clear();
    _getDocumentType();
    _getDocuments();
    filterSearchResults(searchController.text);
  }

  Future<void> _getDocuments() async {
    List<DocumentsDataModel>? list;
    await ApiService().getDocuments().then((value) => list = value);
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => list?.forEach(
        (element) {
          documents.add(FileModel(
              element.id!, '${element.attributes?.documentName}', 'file'));
          setState(() {
            isDocumentsLoaded = true;
          });
        },
      ),
    );
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

  Future<void> _updateDocumentType(int id) async {
    String message = 'Success';
    var response =
        await ApiService().updateDocumentTypes(nameController.text, id);
    if (response.runtimeType != PostDocumentTypeDataAttributesModel) {
      message = response.message;
    }
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => {
        refresh(),
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
          ),
        ),
      },
    );
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
                  } else {
                    _updateDocuments(file.id);
                  }
                  Navigator.pop(context);
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

  void filterSearchResults(String query) {
    List<FileModel> filteredItem = [];
    filteredItem.addAll(documents);
    if (query.isNotEmpty) {
      List<FileModel> dummyListData = [];
      for (var item in filteredItem) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        filteredDocuments.clear();
        filteredDocuments.addAll(dummyListData);
      });
    } else {
      setState(() {
        filteredDocuments.clear();
        filteredDocuments.addAll(filteredItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    filteredDocuments.sort(
      (a, b) {
        var first = a.name;
        var second = b.name;
        return first.compareTo(second);
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        title: const Text('Search'),
      ),
      body: (isFolderLoaded && isDocumentsLoaded)
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
                          width: MediaQuery.of(context).size.width - 84,
                          child: TextField(
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(fontSize: 16),
                              border: UnderlineInputBorder(),
                              filled: true,
                              contentPadding: EdgeInsets.all(16),
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                          ),
                        ),
                        Icon(
                          Icons.search,
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
                        itemCount: filteredDocuments.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0),
                        itemBuilder: (BuildContext context, int index) {
                          if (filteredDocuments[index].type == 'folder') {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FolderPage(
                                      model: documents[index],
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                documentOptions(filteredDocuments[index]);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.folder,
                                    color: Colors.amber.shade900,
                                    size: 50,
                                  ),
                                  Text(
                                    filteredDocuments[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            );
                          } else {
                            return InkWell(
                              onLongPress: () {
                                documentOptions(filteredDocuments[index]);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.insert_drive_file,
                                    color: Colors.amber.shade900,
                                    size: 50,
                                  ),
                                  Text(
                                    filteredDocuments[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            );
                          }
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
