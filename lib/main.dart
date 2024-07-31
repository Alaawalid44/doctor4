import 'package:flutter/material.dart';

void main() {
  runApp(DoctorApp());
}

class DoctorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorHomePage(),
    );
  }
}

class DoctorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hello,'),
            Text(
              'Hi James',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DoctorCard(
              doctorName: 'Dr. Imran Syahir',
              specialization: 'General Doctor',
              appointmentDate: 'Sunday, 12 June',
              appointmentTime: '11:00 - 12:00 AM',
              cardColor: Colors.blue,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search doctor or health issue',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(icon: Icon(Icons.coronavirus), onPressed: () {}),
                IconButton(icon: Icon(Icons.person), onPressed: () {}),
                IconButton(icon: Icon(Icons.local_pharmacy), onPressed: () {}),
                IconButton(icon: Icon(Icons.local_hospital), onPressed: () {}),
              ],
            ),
            SizedBox(height: 20),
            Text('Near Doctor'),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  DoctorListItem(
                    doctorName: 'Dr. Joseph Brostito',
                    specialization: 'Dental Specialist',
                    distance: '1.2 KM',
                    rating: 4.8,
                    reviews: 120,
                    openingTime: '17:00',
                  ),
                  DoctorListItem(
                    doctorName: 'Dr. Imran Syahir',
                    specialization: 'General Doctor',
                    distance: '1.2 KM',
                    rating: 4.8,
                    reviews: 120,
                    openingTime: '17:00',
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

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String appointmentDate;
  final String appointmentTime;
  final Color cardColor;

  DoctorCard({
    required this.doctorName,
    required this.specialization,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: ListTile(
        title: Text(doctorName, style: TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(specialization, style: TextStyle(color: Colors.white70)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(appointmentDate, style: TextStyle(color: Colors.white70)),
                Text(appointmentTime, style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorListItem extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String distance;
  final double rating;
  final int reviews;
  final String openingTime;

  DoctorListItem({
    required this.doctorName,
    required this.specialization,
    required this.distance,
    required this.rating,
    required this.reviews,
    required this.openingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(doctorName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(specialization),
            Row(
              children: <Widget>[
                Icon(Icons.location_on, size: 16),
                SizedBox(width: 4),
                Text(distance),
                Spacer(),
                Icon(Icons.star, size: 16, color: Colors.yellow),
                Text('$rating ($reviews Reviews)'),
                Spacer(),
                Icon(Icons.access_time, size: 16),
                Text('Open at $openingTime'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
