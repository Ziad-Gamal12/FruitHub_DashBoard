import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/variables.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomTextFeiled.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/widgets/IsFeatureProduct.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/widgets/IsOrganicProduct%20copy.dart';

class AddproductviewformtextfieldsSection extends StatelessWidget {
  const AddproductviewformtextfieldsSection(
      {super.key,
      required this.isFeatureChanged,
      required this.isOrganicChanged});
  final ValueChanged<bool> isFeatureChanged;
  final ValueChanged<bool> isOrganicChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFeiled(
            controller: variables.addProductNameController,
            hintText: "Product Name",
            validator: (value) {
              if (value!.isEmpty) {
                return "Product Name is required";
              }
              return null;
            },
            obscureText: false,
            keyboardType: TextInputType.text,
            suffix: null),
        const SizedBox(
          height: 10,
        ),
        CustomTextFeiled(
            controller: variables.addProductProductCodeController,
            hintText: "Product Code",
            validator: (value) {
              if (value!.isEmpty) {
                return "Product Code is required";
              }
              return null;
            },
            obscureText: false,
            keyboardType: TextInputType.text,
            suffix: null),
        const SizedBox(
          height: 10,
        ),
        CustomTextFeiled(
            controller: variables.addProductPriceController,
            hintText: "Product Price",
            validator: (value) {
              if (value!.isEmpty) {
                return "Product Price is required";
              }
              return null;
            },
            obscureText: false,
            keyboardType: TextInputType.number,
            suffix: null),
        const SizedBox(
          height: 10,
        ),
        CustomTextFeiled(
            controller: variables.addProductAmountController,
            hintText: "Product Amount",
            validator: (value) {
              if (value!.isEmpty) {
                return "Product Amount is required";
              }
              return null;
            },
            obscureText: false,
            keyboardType: TextInputType.number,
            suffix: null),
        const SizedBox(
          height: 10,
        ),
        CustomTextFeiled(
            controller: variables.addProductProductExpirationController,
            hintText: "Product expirnations months",
            validator: (value) {
              if (value!.isEmpty) {
                return "Product expirnations is required";
              }
              return null;
            },
            obscureText: false,
            keyboardType: TextInputType.number,
            suffix: null),
        const SizedBox(
          height: 10,
        ),
        CustomTextFeiled(
            controller: variables.addProductProductCaloriesUnitController,
            hintText: "Product calories per Unit ",
            validator: (value) {
              if (value!.isEmpty) {
                return "Product calories Unit is required";
              }
              return null;
            },
            obscureText: false,
            keyboardType: TextInputType.number,
            suffix: null),
        const SizedBox(
          height: 10,
        ),
        IsFeatureProduct(onChanged: (value) {
          isFeatureChanged(value);
        }),
        const SizedBox(
          height: 10,
        ),
        Isorganicproduct(
          onChanged: (value) {
            isOrganicChanged(value);
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFeiled(
            maxLines: 4,
            controller: variables.addProductDescriptionController,
            hintText: "Product Description",
            validator: (value) {
              if (value!.isEmpty) {
                return "Product Description is required";
              }
              return null;
            },
            obscureText: false,
            keyboardType: TextInputType.text,
            suffix: null),
      ],
    );
  }
}
