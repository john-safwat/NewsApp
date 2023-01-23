import 'package:flutter/material.dart';
import 'package:newsapp/Api/ApiManager/API_Manager.dart';
import 'package:newsapp/Api/Models/SourcesModels/SouceResponce.dart';
import 'package:newsapp/Presntation/UI/News/Taps/Taps.dart';

class DetalisTab extends StatelessWidget {
  int index ;
  String id ;
  DetalisTab(this.index , this.id);
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: FutureBuilder<SouceResponce>(
        future: ApiManager.GetSources(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:  CircularProgressIndicator());
          }
          if (snapshot.hasError){
            return Center(
              child: Text(
                "ops Server Error \n ${snapshot.hasError.toString()}",
              ),
            );
          }
          if (snapshot.data?.status == "error"){
            return Center(
              child: Text(
                "Error \n ${snapshot.data?.message}",
              ),
            );
          }else{
            return SourcesTaps(sources: snapshot.data!.sources!);
          }
        },
      ),
    );
  }
}
