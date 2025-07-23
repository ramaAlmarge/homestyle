import 'package:flutter/material.dart';
import 'package:homestyle/model/order_model.dart';
import 'package:homestyle/widget/order_tile.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({super.key});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<OrderModel> allOrders = [
    OrderModel(orderNumber: '238562312', date: '20/03/2020', quantity: 3, totalAmount: 150, status: 'Canceled'),
    OrderModel(orderNumber: '238562312', date: '20/03/2020', quantity: 3, totalAmount: 150, status: 'Processing'),
    OrderModel(orderNumber: '238562312', date: '20/03/2020', quantity: 3, totalAmount: 150, status: 'Delivered'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<OrderModel> getOrdersByStatus(String status) {
    return allOrders.where((order) => order.status == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My orders'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(text: 'Delivered'),
            Tab(text: 'Processing'),
            Tab(text: 'Canceled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList(getOrdersByStatus('Delivered')),
          _buildOrderList(getOrdersByStatus('Processing')),
          _buildOrderList(getOrdersByStatus('Canceled')),
        ],
      ),
    );
  }

  Widget _buildOrderList(List<OrderModel> orders) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderTile(order: orders[index]),
    );
  }
}
