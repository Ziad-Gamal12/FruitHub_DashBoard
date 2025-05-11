import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/Backend_EndPoints.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';
import 'package:fruits_hub_dashboard/Features/orders/data/Models/OrderItemModel.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrderListViewOrderItem.dart';

class Orderslistview extends StatefulWidget {
  const Orderslistview({
    super.key,
  });

  @override
  State<Orderslistview> createState() => _OrderslistviewState();
}

class _OrderslistviewState extends State<Orderslistview> {
  final Stream<QuerySnapshot> ordersStream = FirebaseFirestore.instance
      .collection(BackendEndpoints.getOrders)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: ordersStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong",
                style: textStyles.textstyle19.copyWith(color: Colors.red),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<OrderEntity> orders = snapshot.data!.docs
                .map((e) => OrderItemModel.fromJson(
                        json: e.data() as Map<String, dynamic>)
                    .toEntity())
                .toList();

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: OrderListViewOrderItem(
                    order: orders[index],
                    inExpanded: index == 0 ? true : false,
                  ),
                );
              },
            );
          }
        });
  }
}
