import 'dart:async';
import 'package:cicdtest/salis/core/utils/helper_functions.dart';
import 'package:cicdtest/salis/core/widgets/app_button.dart';
import 'package:cicdtest/salis/myprops/presentation/widgets/my_props_details.dart';
import 'package:cicdtest/salis/props/data/property.dart';
import 'package:flutter/material.dart';

class MyPropsCard extends StatefulWidget {
  final Property property;

  const MyPropsCard({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  _MyPropsCardState createState() => _MyPropsCardState();
}

class _MyPropsCardState extends State<MyPropsCard> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.property.images!.length;
      });
    });
  }

  void _stopAutoSlide() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onNext() {
    _stopAutoSlide();
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.property.images!.length;
    });
    _startAutoSlide();
  }

  void _onPrevious() {
    _stopAutoSlide();
    setState(() {
      _currentIndex = (_currentIndex - 1 + widget.property.images!.length) %
          widget.property.images!.length;
    });
    _startAutoSlide();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Carousel Section
          Stack(
            children: [
              // Image Display
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  widget.property.images![_currentIndex],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Left Arrow Button
              Positioned(
                left: 8,
                top: 75,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: _onPrevious,
                ),
              ),

              // Right Arrow Button
              Positioned(
                right: 8,
                top: 75,
                child: IconButton(
                  icon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: _onNext,
                ),
              ),
            ],
          ),

          // Dots Indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.property.images!.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    _stopAutoSlide();
                    setState(() {
                      _currentIndex = entry.key;
                    });
                    _startAutoSlide();
                  },
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Text Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.property.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.pie_chart, size: 18, color: Colors.grey[700]),
                    const SizedBox(width: 8),
                    Text(
                        'Ownership: ${(widget.property.price - ((widget.property.instalmentPaid)!.toDouble())) * 100 / widget.property.price}%'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.check_circle,
                        size: 18, color: Colors.green),
                    const SizedBox(width: 8),
                    Text('Total Worth: ₦ ${widget.property.price.round()}'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.lock_outline,
                        size: 18, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('Status: ${widget.property.isTaken}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                        'Next Payment : ${widget.property.nextPaymentDueDate}'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < widget.property.rating!.toInt()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          size: 20,
                        );
                      }),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 18, color: Colors.red),
                        const SizedBox(width: 4),
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Text(
                            widget.property.location,
                            softWrap: true,
                            style: const TextStyle(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppButton(
                text: "View",
                onPress: () {
                  HelperFunctions.routePushTo(
                      MyPropsDetails(
                        property: widget.property,
                      ),
                      context);
                },
                width: 100,
              ),
              AppButton(
                text: "Sell",
                onPress: () {},
                width: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
