import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/Core/Utils/variables.dart';
import 'package:fruits_hub_dashboard/Core/widgets/AwesomeDialog.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomButton.dart';
import 'package:fruits_hub_dashboard/Core/widgets/Custom_Loading_Widget.dart';
import 'package:fruits_hub_dashboard/Features/Products/domain/entities/addproduct_entitiy.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/manager/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/widgets/AddProductViewFormTextFields_Section.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/widgets/addProduct_picImage.dart';
import 'package:fruits_hub_dashboard/constent.dart';

class Addproductviewbody extends StatelessWidget {
  Addproductviewbody({super.key});
  File? imageFile;
  bool? isFeature;
  bool? isOrganic;
  GlobalKey<FormState> addproductformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          successdialog(
                  context: context,
                  SuccessMessage: "product added",
                  btnOkOnPress: () {})
              .show();
        } else if (state is AddProductFailure) {
          errordialog(context, state.errmessage).show();
        }
      },
      builder: (context, state) {
        return Custom_Loading_Widget(
          isLoading: state is AddProductLoading ? true : false,
          child: Form(
            key: addproductformkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: KHorizontalPadding, vertical: KVerticalPadding),
                child: Column(
                  children: [
                    AddproductviewformtextfieldsSection(
                      isFeatureChanged: (value) {
                        isFeature = value;
                      },
                      isOrganicChanged: (value) {
                        isOrganic = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    addProduct_picImage(
                      imageFile: (value) {
                        imageFile = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        onPressed: () {
                          if (imageFile != null) {
                            if (addproductformkey.currentState!.validate()) {
                              BlocProvider.of<AddProductCubit>(context)
                                  .addProduct(
                                      product: AddproductEntitiy(
                                reviews: [],
                                name: variables.addProductNameController.text,
                                price: variables.addProductPriceController.text,
                                calories:
                                    variables.addProductCaloriesController.text,
                                amout:
                                    variables.addProductAmountController.text,
                                image: imageFile!,
                                code: variables
                                    .addProductProductCodeController.text
                                    .toLowerCase(),
                                description: variables
                                    .addProductDescriptionController.text,
                                isFeature: isFeature ?? false,
                                isOrganic: isOrganic ?? false,
                                caloriesUnit: variables
                                    .addProductProductCaloriesUnitController
                                    .text,
                                expirnationsMonths: variables
                                    .addProductProductExpirationController.text,
                                rating: 0.0,
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('No image selected'),
                            ));
                          }
                        },
                        text: "Add Product"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
