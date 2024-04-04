import 'package:flutter/material.dart';
import 'package:ud_vote/providers/selected_contestant_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/sub_pages/selected_contestant_bodyUI.dart';

class SelectedContestant extends StatefulWidget {

  final String selectedContestantName;
  final String selectedContestantNumber;

  const SelectedContestant({Key? key, required this.selectedContestantName, required this.selectedContestantNumber}) : super(key: key);

  @override
  State<SelectedContestant> createState() => _SelectedContestantState();
}

class _SelectedContestantState extends State<SelectedContestant> {

  @override
  void initState(){
    final contestantProvider = Provider.of<SelectedContestantProvider>(context, listen: false);
    contestantProvider.getSelectedDataFromApi(widget.selectedContestantNumber);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final contestantProvider = Provider.of<SelectedContestantProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.selectedContestantName),
          centerTitle: true,
          elevation: 0,
        ),

        body: contestantProvider.isLoading?
        getLoadingUI()
            :
        contestantProvider.error.isNotEmpty?
        getErrorUI(contestantProvider.error)
            :
        SelectedContestantBodyUI(selectedContestant: contestantProvider.selectedContestant),
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


