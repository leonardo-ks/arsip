import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/model/document_type_model_entity.dart';
import 'package:arsip/data/model/documents_model.dart';
import 'package:arsip/data/model/file_model.dart';
import 'package:arsip/views/main/folder_page.dart';
import 'package:arsip/views/profile/profile_page.dart';
import 'package:arsip/views/main/search_page.dart';
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

  @override
  void initState() {
    super.initState();
    _getUserInfo();
    _getDocuments();
    _getDocumentType();
  }

  Future<void> _getUserInfo() async {
    await ApiService()
        .getUserInfo()
        .then((value) => usernameController.text = '${value?.username}');
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(() {
        isProfileLoaded = true;
      }),
    );
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

  @override
  Widget build(BuildContext context) {
    if (isDocumentsLoaded && isFolderLoaded && isProfileLoaded) {
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
          title: GestureDetector(
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
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FolderPage(model: documents[index],)),
                            );
                          },
                          child: Column(
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
                          ),
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
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://img.favpng.com/18/23/24/computer-icons-user-profile-portable-network-graphics-vector-graphics-png-favpng-31THvNXgnrmpMkkCSfpupKPpH.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(usernameController.text),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
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
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.amber.shade900,
          ),
        ),
      );
    }
  }
}
