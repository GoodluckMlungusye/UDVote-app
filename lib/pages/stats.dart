import 'package:flutter/material.dart';
import 'package:ud_vote/providers/stats_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/pages/stats_bodyUI.dart';

class Stats extends StatefulWidget {

  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {

  @override
  void initState(){
    final statsProvider = Provider.of<StatsProvider>(context, listen: false);
    statsProvider.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final statsProvider = Provider.of<StatsProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Election Stats'),
          elevation: 0,
          centerTitle: true,
        ),

        body: statsProvider.isLoading?
        getLoadingUI()
            :
        statsProvider.error.isNotEmpty?
        getErrorUI(statsProvider.error)
            :
        StatsBodyUI(years: statsProvider.years),
      ),
    );
  }


  Widget getLoadingUI() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
          ),
          Text(
            "Loading...",
            style: TextStyle(
                color: Colors.indigo,
                fontFamily: 'Poppins',
                fontSize: 20
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }


  Widget getErrorUI(String error) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(
            color: Colors.red,
            fontFamily: 'Poppins',
            fontSize: 20
        ),
        textAlign: TextAlign.center,
      ),

    );
  }

}
