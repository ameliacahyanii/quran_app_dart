import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future _getSurahList() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json'); // Memanggil lokal data

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getSurahList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) => Container(),
    );
  }
}
