import 'package:bright_kid/controller/home_controller.dart';
import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../routes/app_pages.dart';
import '../widget/loader.dart';

class BookingFeeCard extends StatefulWidget {
  HomeController? provider;

  BookingFeeCard({super.key, this.provider});

  @override
  State<BookingFeeCard> createState() => _BookingFeeCardState();
}

class _BookingFeeCardState extends State<BookingFeeCard> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return widget.provider!.loading
        ? LogoLoader()
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF8E2A8A),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: !isExpanded
                            ? Radius.circular(20)
                            : Radius.circular(0),
                      ),
                    ),
                    child: Row(
                      children: [
                         CircleAvatar(
                          radius: 26,
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget
                                        .provider
                                        ?.getAdmissionValue
                                        ?.admission
                                        ?.studentName ??
                                    '---',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${widget.provider?.formatLevel(widget.provider?.getAdmissionValue?.admission?.level ?? '---')} – Early Learning Program",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                widget.provider?.schoolName ?? '---',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: expandedContent(context),
                  secondChild: const SizedBox.shrink(),
                ),
              ],
            ),
          );
  }

  Widget expandedContent(BuildContext context) {
    final provider = widget.provider;
    int currentStep = widget.provider?.getCurrentStep() ?? 0;
    bool isApproved = widget.provider?.getAdmissionValue?.admission?.status == "approved";
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              stepCircle("1", stepNumber: 1, currentStep: currentStep),
              dashedLine(active: currentStep >= 2),
              stepCircle("2", stepNumber: 2, currentStep: currentStep),
              dashedLine(active: currentStep >= 3),
              stepCircle(
                "3",
                stepNumber: 3,
                currentStep: currentStep,
                isApproved: isApproved,
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Booking Fee",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: currentStep >= 1 ? Colors.black : Colors.grey,
                ),
              ),
              Text(
                "Registration",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: currentStep >= 2 ? Colors.black : Colors.grey,
                ),
              ),
              Text(
                "Admission",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: currentStep >= 3 ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        if(currentStep == 3) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Admission Confirmation (Click Admission Module)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "Center confirms the booking and update the fee structure",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
        if (currentStep != 3 && currentStep != 4) ...[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pay Booking Fee",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "₹ ${provider?.getAdmissionValue?.admission?.bookingFee ?? '---'}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: " · Secures the seat",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    if (currentStep == 1) {
                      Navigator.pushNamed(context, Routes.BOOKINGFEESCREEN);
                    } else if (currentStep == 2) {
                      Navigator.pushNamed(context, Routes.JOTFORMSCREEN);
                    }
                  },
                  child: Text(
                    currentStep == 1 ? "Pay Now"
                        : currentStep == 2 ? "Fill Form" : "",
                    style: nunito.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  // ---------- STEP CIRCLE ----------
  Widget stepCircle(
    String text, {required int stepNumber, required int currentStep,
    bool isApproved = false,}) {
    Color bgColor;
    if (stepNumber < currentStep) {
      bgColor = Colors.green;
    } else if (stepNumber == currentStep) {
      bgColor = isApproved && stepNumber == 3 ? Colors.green : Colors.orange;
    } else {
      bgColor = Colors.grey.shade300;
    }
    return CircleAvatar(
      radius: 16,
      backgroundColor: bgColor,
      child: Text(
        text,
        style: TextStyle(
          color: stepNumber <= currentStep ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ---------- DASHED LINE ----------
  Widget dashedLine({required bool active}) {
    return Expanded(
      child: Row(
        children: List.generate(
          10,
          (index) => Expanded(
            child: Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              color: active ? Colors.green : Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
