
import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/fees_details/model/fees_model.dart';


class FeeItemWidget extends StatelessWidget {
  final FeeModel fee;
  final VoidCallback onToggleExpanded;

  const FeeItemWidget({
    super.key,
    required this.fee,
    required this.onToggleExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F6FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header section
          GestureDetector(
            onTap: onToggleExpanded,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          "School Fee for ${fee.month}",
                          color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              "₹ ${fee.paidFee.toStringAsFixed(0)}",
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            10.widthBox,
                            Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const TextWidget(
                          "Paid",
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        fee.paymentDate,
                        color: Colors.black.withValues(alpha: 0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 4),
                      Icon(
                    fee.isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.red,
                  ),
                      
                    ],
                  ),
                  
                  
                ],
              ),
            ).color(const Color(0xFFE5F6FD)),
          ),

          // Expanded details section
          if (fee.isExpanded)
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                children: [
                  _buildFeeRow("Total Fee", fee.totalFee),
                  _buildFeeRow("Extra Fee", fee.extraFee),
                  _buildFeeRow("Late Charges", fee.lateCharges),
                  _buildFeeRow("Discount (20%)", -fee.discount),
                  const Divider(height: 24, thickness: 1),
                  _buildFeeRow("Paid Fee", fee.paidFee, isBold: true),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeeRow(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            label,
            fontSize: 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            color: Colors.black87,
          ),
          TextWidget(
            amount < 0
                ? "- ₹ ${amount.abs().toStringAsFixed(0)}"
                : "₹ ${amount.toStringAsFixed(0)}",
            fontSize: 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            color: amount < 0 ? Colors.red : Colors.black87,
          ),
        ],
      ),
    );
  }
}
