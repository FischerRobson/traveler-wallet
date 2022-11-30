import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/components/currency_container.dart';

class PricesScreen extends StatefulWidget {
  const PricesScreen({super.key});

  @override
  State<PricesScreen> createState() => _PricesScreenState();
}

class _PricesScreenState extends State<PricesScreen> {

  late Response response;
  Dio dio = Dio();
  var apidata;

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = "";

  getData() async {
    String baseUrl = "https://economia.awesomeapi.com.br/last/USD-BRL";

    Response response = await dio.get(baseUrl);
    apidata = response["USDBRL"];
    print(response);

    if(response.statusCode == 200){
      if(apidata["error"]){
        error = true;
        errmsg  = apidata["msg"];
      }
    }else{
      error = true;
      errmsg = "Error while fetching data.";
    }
  }

  @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: loading?
        const CircularProgressIndicator() :
        Container(
            child:error?Text("Error: $errmsg"):
            Column(
              children:apidata["data"].map<Widget>((coin){
                return CurrencyContainer(
                    name: coin["name"],
                    increase: coin["varBid"],
                    symbol: coin["code"],
                    value: coin["high"]
                  );
              }).toList(),
            )
        )
    );
  }
}