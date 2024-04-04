import 'package:flutter/material.dart';
import 'package:ud_vote/providers/results_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/sub_pages/selected_results_bodyUI.dart';

class SelectedResults extends StatefulWidget {

  final String categoryName;
  const SelectedResults({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<SelectedResults> createState() => _SelectedResultsState();
}

class _SelectedResultsState extends State<SelectedResults> {

  @override
  void initState(){
    final resultsProvider = Provider.of<ResultsProvider>(context, listen: false);
    resultsProvider.getDataFromApi(widget.categoryName,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final resultsProvider = Provider.of<ResultsProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.categoryName} results'),
          centerTitle: true,
          elevation: 0,
        ),

        body: resultsProvider.isLoading?
        getLoadingUI()
            :
        resultsProvider.error.isNotEmpty?
        getErrorUI(resultsProvider.error)
            :
        SelectedResultsBodyUI(results: resultsProvider.results),
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
