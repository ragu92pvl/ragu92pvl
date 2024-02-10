

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:userapp/provider/data_provider.dart';
import 'package:userapp/utils/validation_utils.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    // var prodRef = ref.watch(productDataProvider);
    return Scaffold(
      // body: prodRef.when(
      //     data: (data){
      //       context.loaderOverlay.hide();
      //       return ListView.builder(
      //           itemCount: data.products!.length,
      //           itemBuilder: (BuildContext context,int index){
      //             var productData = data.products![index];
      //             return Text(
      //                 productData.description!
      //             );
      //           });
      //     },
      //     error: (err,s){
      //       ValidationUtils.showAppToast(err.toString());
      //     },
      //     loading: (){
      //       context.loaderOverlay.show();
      //     }
      // ),
    );
  }
}
