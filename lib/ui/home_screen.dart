import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/global.dart';
import 'package:quran_app/ui/tabs/hijb_tab.dart';
import 'package:quran_app/ui/tabs/page_tab.dart';
import 'package:quran_app/ui/tabs/para_tab.dart';
import 'package:quran_app/ui/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Start styling
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4, // Total amount pages that we want to display
        child: Padding (
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: _salam() // No need coma; coma only for object
                  ),
                  SliverAppBar( // SAP App bar
                    automaticallyImplyLeading: false, // Hide the default button (back button)
                    elevation: 0,
                    pinned: true, // Make it sticky
                    shape: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: primary.withOpacity(.1),
                      )
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0),
                      child: _tab(),
                    ),
                  ),
                ],
                body: const TabBarView(
                  children: [
                    SurahTab(),
                    ParaTab(),
                    PageTab(),
                    HijbTab()
                  ],
                )
            ),
        ),
      ),
    );
  }

  TabBar _tab() {
    return TabBar(
      tabs: [
        _tabItem(label: 'Surah'),
        _tabItem(label: 'Para'),
        _tabItem(label: 'Page'),
        _tabItem(label: 'Hijb'),
      ],
      indicator: UnderlineTabIndicator(
        borderSide:
        BorderSide(
            width: 5,
            color: primary,
        ),
        insets: EdgeInsets.symmetric(horizontal: 60),
      ),
    );
  }

  Tab _tabItem({required String label}) {
    return Tab(

      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  Column _salam() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assalamualaikum',
            style: GoogleFonts.poppins(
              color: secondary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Amelia Cahyani',
            style: GoogleFonts.poppins(
              color: text,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          _lastRead()
        ],
      );
  }

  Stack _lastRead() {
    return Stack(
          children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFDF98FA),
                      Color(0xFF9055FF),
                    ]
                  )
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('/svg/banner_quran.svg')
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('/svg/book_icon.svg'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Last Read',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Al-Fatihah',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      'Ayah No: 1',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
  }

  AppBar _appBar() => AppBar( // Inline function
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false, // Make the back button gone
    title: Row(
      children: [
        IconButton(
            onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/menu_icon.svg')
        ),
        const SizedBox( // Padding antar elenent
          width: 24,
        ),
        Text(
          'Quran App',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: (() => {}) ,
            icon: SvgPicture.asset('/svg/search_icon.svg')
        ),
      ],
    ),
  );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    items: [
      _bottomNavigationBarItem(icon: '/svg/quran_icon.svg', label: 'Quran'), // Object instance Process
      _bottomNavigationBarItem(icon: '/svg/doa_icon.svg', label: 'Doa'), // Object instance Process
      _bottomNavigationBarItem(icon: '/svg/bookmark_icon.svg', label: 'Bookmark'), // Object instance Process
    ],
  );

  BottomNavigationBarItem _bottomNavigationBarItem({required String icon, required String label}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset( // inactive icon style
          icon,
          color: secondary,
        ),
        activeIcon: SvgPicture.asset( // active icon style
          icon,
          color: primary,
        ),
        label: label,
      );
}



