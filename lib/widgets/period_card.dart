import 'package:flutter/material.dart';
import '../models/period_model.dart';

class PeriodCard extends StatelessWidget {
  final Period period;

  const PeriodCard({Key? key, required this.period}) : super(key: key);

  void _showDetailsDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: theme.dialogBackgroundColor,
        title: Text(
          period.subjectFullName,
          style: theme.textTheme.titleLarge,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetailRow("👨‍🏫 Faculty", period.facultyFullName, theme),
            _buildDetailRow("⏰ Time", period.time, theme),
            _buildDetailRow("👥 Batch", period.batch, theme),
            _buildDetailRow("🏫 Room", period.room, theme),
          ],
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status, BuildContext context) {
    switch (status) {
      case 'Started':
        return Colors.green;
      case 'Upcoming':
        return Colors.orange;
      case 'Completed':
        return Colors.grey;
      default:
        return Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => _showDetailsDialog(context),
      child: Card(
        color: theme.cardColor,
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                period.subjectFullName,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text("🧑‍🏫 Faculty: ${period.facultyFullName}", style: theme.textTheme.bodyMedium),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyMedium,
                  children: [
                    TextSpan(text: "🕒 ${period.time} "),
                    TextSpan(
                      text: "(${period.lectureStatus})",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getStatusColor(period.lectureStatus, context),
                      ),
                    ),
                  ],
                ),
              ),
              Text("🎓 Batch: ${period.batch}", style: theme.textTheme.bodyMedium),
              Text("🏫 Room: ${period.room}", style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
