import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/widgets/radial_progress_bar.dart';

class SwiperCard extends StatelessWidget {
  const SwiperCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade100,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(
          children: [
            _Percentage(),
            SizedBox(height: 20.0),
            _MainContent(),
            SizedBox(height: 20.0),
            Divider(thickness: 0.8),
            SizedBox(height: 20.0),
            _UserInfo(),
          ],
        ),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.0),
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Juan Poole',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Glen James',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 30.0),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey,
                  ),
                ],
              ),
              Spacer(flex: 6),
              Text(
                'Jeff.',
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Spacer(flex: 1),
              Text(
                'Illustration',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Spacer(flex: 1),
              Container(
                alignment: Alignment.center,
                width: 60.0,
                height: 25.0,
                color: Colors.deepOrange.withOpacity(0.2),
                child: Text(
                  '\$19',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          Container(
            height: 200.0,
            width: 180.0,
            child: SvgPicture.asset('assets/auction_app/draw_1.svg'),
          ),
        ],
      ),
    );
  }
}

class _Percentage extends StatelessWidget {
  const _Percentage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.0),
        Text(
          '80% is solved',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          height: 85.0,
          width: 85.0,
          padding: const EdgeInsets.all(15.0),
          child: RadialProgressBar(
            elevated: true,
            percentage: 80,
            showPercentage: true,
            backgroundColor: Colors.white,
            valueStrokeWidth: 5.0,
            backgroundStrokeWidth: 5.0,
            percentageStyle: TextStyle(fontSize: 15.0),
          ),
        ),
      ],
    );
  }
}
