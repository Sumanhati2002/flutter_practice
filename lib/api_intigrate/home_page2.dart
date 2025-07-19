import 'dart:convert';
import 'package:flutter/material.dart';
import 'model_2.dart';
import 'package:http/http.dart' as http;

class ListApiPage extends StatefulWidget {
  const ListApiPage({super.key});

  @override
  State<ListApiPage> createState() => _ListApiPageState();
}

class _ListApiPageState extends State<ListApiPage> {
  late Future<List<Sample>> sampleData;

  @override
  void initState() {
    super.initState();
    sampleData = getSampleDat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("User List")),
        body: FutureBuilder<List<Sample>>(
          future: sampleData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Container(
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${item.id}'),
                        Text('Name: ${item.name}'),
                        Text('Username: ${item.username}'),
                        Text('Email: ${item.email}'),
                        Text('City: ${item.address?.city}'),
                        Text('Company: ${item.company?.name}'),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data found'));
            }
          },
        ),
      );
  }

  Future<List<Sample>> getSampleDat() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    print('Status Code: ${response.statusCode}');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Sample.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
