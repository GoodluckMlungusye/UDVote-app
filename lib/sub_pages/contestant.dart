import 'package:flutter/material.dart';
import 'package:ud_vote/providers/contestant_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/sub_pages/contestant_bodyUI.dart';

class Contestant extends StatefulWidget {

  final String categoryName;

  const Contestant({Key? key,required this.categoryName}) : super(key: key);

  @override
  State<Contestant> createState() => _ContestantState();
}

class _ContestantState extends State<Contestant> {

  @override
  void initState(){
    final contestantProvider = Provider.of<ContestantProvider>(context, listen: false);
    contestantProvider.getDataFromApi(widget.categoryName);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final contestantProvider = Provider.of<ContestantProvider>(context);


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
          centerTitle: true,
          elevation: 0,
        ),
        body: contestantProvider.isLoading?
        getLoadingUI()
            :
        contestantProvider.error.isNotEmpty?
        getErrorUI(contestantProvider.error)
            :
         ContestantBodyUI(categoryContestants: contestantProvider.categoryContestants),
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
