import 'package:cloud_firestore/cloud_firestore.dart'; // Add this to your package
import 'package:rms_shared_package/enums/enums.dart';
import 'package:rms_shared_package/models/order_model/ordered_menu_model.dart';

class OrderModel {
  String id;
  String tableNumber;
  int seatCount;
  OrderStatus orderStatus;
  List<OrderedMenuModel> orderedMenu;
  double totalAmount;
  PaymentMethod? paymentMethod;
  PaymentStatus paymentStatus;
  DateTime createdAt;
  DateTime updatedAt;

  OrderModel({
    required this.id,
    required this.tableNumber,
    required this.orderedMenu,
    this.paymentMethod,
    required this.paymentStatus,
    required this.orderStatus,
    required this.totalAmount,
    required this.seatCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      tableNumber: json['tableNumber'] ?? '',
      // CRITICAL: Map the list of items
      orderedMenu:
          (json['orderedMenu'] as List?)
              ?.map((item) => OrderedMenuModel.fromJson(item))
              .toList() ??
          [],
      // CRITICAL: Convert String/Int back to Enums
      paymentMethod: json['paymentMethod'] != null
          ? PaymentMethod.values.byName(json['paymentMethod'])
          : null,
      paymentStatus: PaymentStatus.values.byName(json['paymentStatus']),
      orderStatus: OrderStatus.values.byName(json['orderStatus']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      seatCount: json['seatCount'] ?? 0,
      // CRITICAL: Handle Firestore Timestamps
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  /// FULL DATA: Used for /orders collection (Billing/Manager Apps)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tableNumber': tableNumber,
      'orderedMenu': orderedMenu.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod?.name,
      'paymentStatus': paymentStatus.name,
      'orderStatus': orderStatus.name,
      'totalAmount': totalAmount,
      'seatCount': seatCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  /// LITE DATA: Used for /kitchen_queue (KDS App)
  /// This saves reads/bandwidth by excluding billing data.
  Map<String, dynamic> toKitchenJson() {
    return {
      'id': id,
      'tableNumber': tableNumber,
      'orderedMenu': orderedMenu.map((e) => e.toKitchenJson()).toList(),
      'orderStatus': orderStatus.name,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
