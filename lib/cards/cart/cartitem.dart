import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final int price; // Price per unit
  final int quantity; // Current quantity
  final ValueChanged<int> onQuantityChanged; // Callback for quantity changes
  final VoidCallback onRemove; // Callback for item removal

  const CartItemWidget({
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate total price for the current product
    int totalPrice = price * quantity;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Item Image
          Container(
            width: 80,
            height: 80,

            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("assests/image/img_10.png",fit: BoxFit.fill,),// Placeholder for image
          ),
          const SizedBox(width: 16.0),
          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bashpika tulasi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text("medicine"),
                Text("$totalPrice rs"), // Display total price
              ],
            ),
          ),
          // Quantity Adjuster
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (quantity > 1) {
                    onQuantityChanged(quantity - 1); // Decrease quantity
                  }
                },
                icon: const Icon(Icons.remove),
              ),
              Text("$quantity"), // Quantity value
              IconButton(
                onPressed: () {
                  onQuantityChanged(quantity + 1); // Increase quantity
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          // Remove Button
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}