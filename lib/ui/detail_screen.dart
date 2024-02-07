import 'dart:js_interop_unsafe';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int surahNumber;
  const DetailScreen({super.key, required this.surahNumber});

  Future _surahDetail() async {
    var response = await Dio().get('https://equran.id/api/surat/$surahNumber');
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _surahDetail(),
        builder: ((context, snapshot) =>
          SafeArea(child: Text('$surahNumber'))
        ),
      ),
    );
  }
}
