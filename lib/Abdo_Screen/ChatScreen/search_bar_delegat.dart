import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Android',
    'Ios',
    'Flutter',
    'Web',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(
        color: const Color(0xff161616),
        child: IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
            color:  Color(0xFFFF4B26),
          ),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container(
      color: const Color(0xff161616),
      child: IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color:  Color(0xFFFF4B26),
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Container(
      color: const Color(0xff161616),
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var resuilt = matchQuery[index];
          return ListTile(
            title: Text(
              resuilt,
              style: const TextStyle(
                color:  Color(0xFFFF4B26),
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Container(
      color: const Color(0xff161616),
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          var resuilt = matchQuery[index];
          return ListTile(
            title: Text(
              resuilt,
              style: const TextStyle(
                color: Color(0xFFFF4B26),
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }),
      ),
    );
  }
}
