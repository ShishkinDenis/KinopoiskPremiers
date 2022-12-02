/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ListView'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            fetchData();
          },
          child: FutureBuilder<List<Data>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data>? data = snapshot.data;
                return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 75,
                        color: Colors.white,
                        child: Center(
                          child: Text(data![index].title),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<List<Data>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}*/

// class Data {
//   final int userId;
//   final int id;
//   final String title;
//
//   Data({required this.userId, required this.id, required this.title});
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
//


//FILMS

/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_view/domain/model/film.dart';

import '../bloc/films_bloc.dart';
import '../film_info.dart';
import '../styles.dart';

import 'package:http/http.dart' as http;

class Films extends StatefulWidget {
  const Films({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilmsState();
  }
}

class _FilmsState extends State<Films> {
  // final List<FilmDetail> items = [];
  List<Film> items = [];
  final FilmsBloc _filmsBloc = FilmsBloc();

  @override
  void initState() {
    _filmsBloc.add(GetFilmsList());
    super.initState();
    // _getFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Kinopoisk Premiers",
              style: Styles.navBarTitle,
            )),
        body: RefreshIndicator(
            onRefresh: () async {
              // _getFilms();
            },
            child: ListView.builder(
                itemCount: this.items.length,
                itemBuilder: _listViewItemBuilder)));
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var filmDetail = this.items[index];
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(filmDetail),
        title: _itemTitle(filmDetail),
        onTap: () {
          _navigationToFilmDetail(context, filmDetail);
        });
  }

  void _navigationToFilmDetail(BuildContext context, Film filmDetail) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FilmInfo(filmDetail);
    }));
  }

  Widget _itemThumbnail(Film filmDetail) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: filmDetail.posterUrlPreview == null
          ? null
          : Image.network(filmDetail.posterUrlPreview, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(Film filmDetail) {
    return Text(filmDetail.nameRu, style: Styles.textDefault);
  }

// void _getFilms() async {
//   final http.Response response = await http.get(
//       Uri.parse(
//           "https://kinopoiskapiunofficial.tech/api/v2.2/films/premieres?year=2022&month=NOVEMBER"),
//       headers: {
//         'X-API-KEY': 'ea2d8faf-7451-4b43-83e1-386fcf829f02',
//         'Content-Type': 'application/json',
//       });
//   if (response.statusCode == 200) {
//     List<Film> items = [];
//     final Map<String, dynamic> responseData =
//         json.decode(utf8.decode(response.bodyBytes));
//     responseData['items'].forEach((filmDetail) {
//       final Film films = Film(
//           nameEn: filmDetail['nameEn'],
//           nameRu: filmDetail['nameRu'],
//           posterUrlPreview: filmDetail['posterUrlPreview']);
//       // setState(() {
//       items.add(films);
//     });
//     // });
//     setState(() {
//       this.items = items;
//     });
//   } else {
//     throw Exception('Unexpected error occured!');
//   }
// }
}*/
