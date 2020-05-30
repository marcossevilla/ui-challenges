import 'package:flutter/material.dart';

import '../widgets/radial_progress_bar.dart';

class CharityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/charity_app/placeholder.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  Text(
                    'Feed children around the world',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 20.0),
                      Text('Worldwide'),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('RAISED OF', style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 5.0),
                          Text('\$3,340,500', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 40,
                        width: 40,
                        child: RadialProgressBar(
                          percentage: 78,
                          showPercentage: true,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          valueColor: Colors.red,
                          valueStrokeWidth: 4,
                          percentageStyle: TextStyle(fontSize: 15.0),
                          backgroundStrokeWidth: 3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
