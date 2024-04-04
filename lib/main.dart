import 'package:flutter/material.dart';
import 'package:ud_vote/providers/selected_contestant_provider.dart';
import 'package:ud_vote/providers/stat_info_provider.dart';
import 'app.dart';
import 'package:ud_vote/providers/motivator_provider.dart';
import 'package:ud_vote/providers/category_provider.dart';
import 'package:ud_vote/providers/contestant_provider.dart';
import 'package:ud_vote/providers/voter_provider.dart';
import 'package:ud_vote/providers/results_provider.dart';
import 'package:ud_vote/providers/stats_provider.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => MotivatorProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ContestantProvider()),
        ChangeNotifierProvider(create: (context) => VoterProvider()),
        ChangeNotifierProvider(create: (context) => ResultsProvider()),
        ChangeNotifierProvider(create: (context) => StatsProvider()),
        ChangeNotifierProvider(create: (context) => SelectedContestantProvider()),
        ChangeNotifierProvider(create: (context) => StatInfoProvider()),
      ],
      child: const MyApp()

  ));

}
