import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomExpansionWidget.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderShippingEntity.dart';
import 'package:provider/provider.dart';

class CustomOrderItemOrderShipping extends StatelessWidget {
  const CustomOrderItemOrderShipping({super.key});

  @override
  Widget build(BuildContext context) {
    OrderShippingEntity orderShippingEntity =
        context.read<OrderEntity>().orderShippingEntity;

    return Customexpansionwidget(
        title: "Shipping",
        leadingWidget: Animate(
          effects: [
            SlideEffect(
              begin: const Offset(-2, 0),
              end: Offset.zero,
              duration: 500.ms,
              curve: Curves.easeOut,
            )
          ],
          child: const Icon(
            FontAwesomeIcons.truckFast,
            color: Colors.green,
          ),
        ),
        child: Column(children: [
          Rowinfo(
            title: "Full Name",
            value: orderShippingEntity.fullname,
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Email",
            value: orderShippingEntity.email,
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Phone",
            value: orderShippingEntity.phoneNumber,
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Address",
            value: orderShippingEntity.address,
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "City",
            value: orderShippingEntity.city,
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Flat Number",
            value: orderShippingEntity.flat,
          ),
        ]));
  }
}
