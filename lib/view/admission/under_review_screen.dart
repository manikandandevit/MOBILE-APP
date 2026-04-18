import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';

class AdmissionUnderReviewPage extends StatelessWidget {
  const AdmissionUnderReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3EF),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Admission",
          style: nunitoSans.copyWith(
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// ICON
            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF5AA9FF), Color(0xFF2F80ED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Image.asset("asset/image/under_review.png"),
            ),

            const SizedBox(height: 16),

            /// TITLE
            Text(
              'Under Review',
              style: nunitoSans.copyWith(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600
              )
            ),

            const SizedBox(height: 8),

            /// DESCRIPTION
            Text(
              'Admission details are being reviewed by our team. '
                  'Thank you for your patience as we finalize everything.',
              textAlign: TextAlign.center,
                style: nunitoSans.copyWith(
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500
                )
            ),

            const SizedBox(height: 24),

            /// CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Once the centre approves your application,\n'
                        'you can proceed with the following steps.',
                      style: nunitoSans.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400
                      )
                  ),

                  const SizedBox(height: 20),

                  /// STEPS
                  StepIndicator(),

                  const SizedBox(height: 20),

                  InfoItem(
                    title: 'Verify Key Details',
                    description:
                    'Please review the admission details like Name, DOB, '
                        'Level and Contact details.',
                  ),

                  const SizedBox(height: 12),

                  InfoItem(
                    title: 'Profile Icon',
                    description:
                    'Upload your child’s photo to create their profile icon.',
                  ),

                  const SizedBox(height: 12),

                  InfoItem(
                    title: 'Pick-up Details',
                    description:
                    'Add up to 3 authorized pickup persons (Photo, Name & '
                        'Mobile No.) for your child’s safe handover after school.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- STEP INDICATOR ----------------

class StepIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          stepCircle('1'),
          stepLine(),
          stepCircle('2'),
          stepLine(),
          stepCircle('3'),
        ],
      ),
    );
  }

  Widget stepCircle(String text) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
          style: nunitoSans.copyWith(
              fontSize: 14,
              color: AppColors.black.withOpacity(0.65),
              fontWeight: FontWeight.w600
          )
      ),
    );
  }

  Widget stepLine() {
    return Expanded(
      child: Row(
        children: List.generate(10, (index) => Expanded(
            child: Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------- INFO ITEM ----------------

class InfoItem extends StatelessWidget {
  final String title;
  final String description;

  const InfoItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
            style: nunitoSans.copyWith(
                fontSize: 14,
                color: AppColors.black.withOpacity(0.65),
                fontWeight: FontWeight.w600
            )
        ),
        const SizedBox(height: 4),
        Text(
          description,
            style: nunitoSans.copyWith(
                fontSize: 12,
                color: AppColors.black.withOpacity(0.65),
                fontWeight: FontWeight.w400
            )
        ),
      ],
    );
  }
}