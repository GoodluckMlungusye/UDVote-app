import 'package:flutter/material.dart';
import 'package:ud_vote/providers/stat_info_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/sub_pages/selected_stats_BodyUI.dart';

class SelectedStats extends StatefulWidget {

  final int year;
  const SelectedStats({Key? key, required this.year}) : super(key: key);

  @override
  State<SelectedStats> createState() => _SelectedStatsState();
}

class _SelectedStatsState extends State<SelectedStats> {

  @override
  void initState(){
    final statsProvider = Provider.of<StatInfoProvider>(context, listen: false);
    statsProvider.getSelectedDataFromApi(widget.year);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final statsProvider = Provider.of<StatInfoProvider>(context);


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text('${widget.year} stats'),
          elevation: 0,
          centerTitle: true,
        ),

        body: statsProvider.isLoading?
        getLoadingUI()
            :
        statsProvider.error.isNotEmpty?
        getErrorUI(statsProvider.error)
            :
        SelectedStatsBodyUI(collegeInfo: statsProvider.collegeInfo),
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
