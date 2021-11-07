import 'package:chatty/screens/register_page/widgets/country_codes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountrySearchDelegate extends SearchDelegate<CountryCode> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults();
  }

  List<CountryCode> get _values {
    return codes
        .where((Map<String, String> json) {
          return json['name']!.toLowerCase().contains(query.toLowerCase());
        })
        .map((Map<String, String> json) => CountryCode.fromJson(json))
        .toList();
  }

  ListView _buildResults() {
    final List<CountryCode> values = _values;
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        final CountryCode code = values[index];

        return ListTile(
          onTap: () {
            close(context, code);
          },
          title: Text('(${code.dialCode}) ${code.name}'),
        );
      },
    );
  }
}
