import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/surah.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json'); // Memanggil lokal data
    // print(data);
   return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>> (
      future: _getSurahList(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
        if(!snapshot.hasData) {
          return Container();
        }
        return ListView.separated(
            itemBuilder: (context, index) => _surahItem(surah: snapshot.data!.elementAt(index)),
            separatorBuilder: (context, index) => Container(),
            itemCount: snapshot.data!.length
        );
      }
    );
  }
  
  Container _surahItem({required Surah surah}) => Container(
    child: Text(
      'RPL',
      style: GoogleFonts.poppins(color: Colors.black),
    )
  );
}
