import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/model/document_type_model_entity.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/file_model.dart';
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

  @override
  void initState() {
    super.initState();
    _getDocumentType();
    _getDocuments();
  }

  Future<void> _getDocuments() async {
    List<DocumentsDataModel>? list;
    await ApiService().getDocuments().then((value) => list = value);
    Future.delayed(const Duration(seconds: 1)).then(
          (value) => list?.forEach(
            (element) {
          documents.add(FileModel(0, '${element.attributes?.documentName}', 'file'));
          setState(() {
            isDocumentsLoaded = true;
          });
        },
      ),
    );
  }

  Future<void> _getDocumentType() async {
    List<DocumentTypesDataModel>? list;
    await ApiService().getDocumentTypes().then((value) => list = value);
    Future.delayed(const Duration(seconds: 1)).then(
          (value) => list?.forEach(
            (element) {
          documents.add(FileModel(element.id!, '${element.attributes?.type}', 'folder'));
          setState(() {
            isFolderLoaded = true;
          });
        },
      ),
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
    if (isFolderLoaded && isDocumentsLoaded) {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        return Column(
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
                              filteredDocuments[index].name,
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
          title: const Text('Search'),
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
