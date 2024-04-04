import 'package:flutter/material.dart';
import 'package:ud_vote/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:ud_vote/pages/results_bodyUI.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  @override
  void initState(){
    final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.getDataFromApi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoryProvider>(context);

    return  SafeArea(
      child: Scaffold(
        body: categoryProvider.isLoading?
        getLoadingUI()
            :
        categoryProvider.error.isNotEmpty?
        getErrorUI(categoryProvider.error)
            :
        ResultsBodyUI(categories: categoryProvider.categories),
      )
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
