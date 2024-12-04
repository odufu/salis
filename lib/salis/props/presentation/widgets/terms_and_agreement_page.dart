import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:cicdtest/salis/props/presentation/widgets/payment_summary_page.dart';
import 'package:flutter/material.dart';

class TermsAndAgreementPage extends StatelessWidget {
  final VoidCallback onAccept;

  const TermsAndAgreementPage({required this.onAccept, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Co-Ownership Agreement',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(
            "Agreement Overview",
            context,
          ),
          _buildSectionDetails(
            "The co-ownership agreement ('Agreement',context,) is entered into between [Salis Homes] and [Co-Owner(s)] for the joint ownership of the property located at [Property Address].",
            context,
          ),
          _buildSectionHeader(
            "Co-Ownership Percentage",
            context,
          ),
          _buildSectionDetails(
            "The Co-Owner(s) agree to purchase an ownership share of the property as specified in the agreement.",
            context,
          ),
          _buildSectionHeader(
            "Payment Terms",
            context,
          ),
          _buildSectionDetails(
            "The total property cost is [Total Cost]. Co-Owner(s) agree to make payments according to the specified schedule provided in the Agreement.",
            context,
          ),
          _buildSectionHeader(
            "Co-Ownership Responsibilities",
            context,
          ),
          _buildSectionDetails(
            "Co-Owner(s) acknowledge and agree to share responsibilities and costs related to property maintenance, taxes, and other associated expenses in proportion to their ownership percentage.",
            context,
          ),
          _buildSectionHeader(
            "Decision-Making",
            context,
          ),
          _buildSectionDetails(
            "Major decisions affecting the property, such as renovations or changes to the property structure, require unanimous consent from all Co-Owner(s).",
            context,
          ),
          _buildSectionHeader(
            "Dispute Resolution",
            context,
          ),
          _buildSectionDetails(
            "Disputes arising from this Agreement will be resolved through mediation or arbitration in accordance with the laws of [Jurisdiction].",
            context,
          ),
          _buildSectionHeader(
            "Termination of Co-Ownership",
            context,
          ),
          _buildSectionDetails(
            "The co-ownership agreement may be terminated by mutual consent of all Co-Owner(s) or in the event of a breach of the terms outlined in this Agreement.",
            context,
          ),
          _buildSectionHeader(
            "Legal Compliance",
            context,
          ),
          _buildSectionDetails(
            "Co-Owner(s) agree to comply with all local laws and regulations related to property ownership and co-ownership.",
            context,
          ),
          _buildSectionHeader(
            "Confidentiality",
            context,
          ),
          _buildSectionDetails(
            "All parties agree to keep financial and personal information confidential and not to disclose such information without the written consent of the parties involved.",
            context,
          ),
          _buildSectionHeader(
            "Governing Law",
            context,
          ),
          _buildSectionDetails(
            "This Agreement is governed by and interpreted in accordance with the laws of [Jurisdiction].",
            context,
          ),
          const SizedBox(
              height:
                  100), // Add space to ensure content is scrollable above footer
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: AppButton(
          text: "Accept Agreement",
          onPress: () {
            HelperFunctions.routePushTo(const PaymentSummaryPage(), context);
          },
          width: 300,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ));
  }

  Widget _buildSectionDetails(String details, BuildContext context) {
    return Text(
      details,
      style: TextStyle(
        fontSize: 16.0,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
