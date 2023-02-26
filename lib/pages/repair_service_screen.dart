import 'package:flutter/material.dart';
import 'package:x_app_flutter/models/service.dart';

class RepairServiceScreen extends StatelessWidget {
  final List<Service> services = [
    Service(
      title: 'Screen Repair',
      imageUrl: 'assets/images/screen_repair.jpg',
      price: 50,
      id: 1,
    ),
    Service(
      title: 'Battery Replacement',
      imageUrl: 'assets/images/battery_replacement.jpg',
      price: 30,
      id: 2,
    ),
    Service(
      title: 'Camera Repair',
      imageUrl: 'assets/images/camera_repair.jpg',
      price: 40,
      id: 3,
    ),
    Service(
      title: 'Charging Port Repair',
      imageUrl: 'assets/images/charging_port_repair.jpg',
      price: 20,
      id: 4,
    ),
    Service(
      title: 'Speaker Repair',
      imageUrl: 'assets/images/speaker_repair.jpg',
      price: 25,
      id: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Repair Service'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the service detail screen
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        services[index].imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    services[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    services[index].price != null
                        ? "\$" '${services[index].price.toString()}'
                        : '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
