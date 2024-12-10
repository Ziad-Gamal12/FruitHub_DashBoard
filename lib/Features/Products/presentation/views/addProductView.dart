import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/Core/Utils/get_it.dart';
import 'package:fruits_hub_dashboard/Core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/Core/repos/porducts/products_repo.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/widgets/Addproductviewbody.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/widgets/addProductView_appBar.dart';

class Addproductview extends StatelessWidget {
  const Addproductview({super.key});
  static const routeName = "addproductview";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
          imagesRepo: getIt<ImagesRepo>(), productsRepo: getIt<ProductsRepo>()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AddproductviewAppbar(),
          body: Addproductviewbody(),
        );
      }),
    );
  }
}
