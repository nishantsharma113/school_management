import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_map/provider/school_map_provider.dart';
import 'package:school_management/features/school_map/widgets/location_card.dart';
import 'package:school_management/features/school_map/widgets/location_search_bar.dart';
import 'package:school_management/features/school_map/widgets/location_type_filter.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';
import 'package:school_management/widgets/common/loading_widget.dart';

class SchoolMapScreen extends StatefulWidget {
  const SchoolMapScreen({super.key});

  @override
  State<SchoolMapScreen> createState() => _SchoolMapScreenState();
}

class _SchoolMapScreenState extends State<SchoolMapScreen> {
  GoogleMapController? _mapController;
  double _bottomSheetHeight = 0;

  @override
  void initState() {
    super.initState();
    
    // Load data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SchoolMapProvider>().getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'School Map',
        showtitle: true,
      ),
      body: Consumer<SchoolMapProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const LoadingWidget();
          }
          
          return Stack(
            children: [
              // Map
              GoogleMap(
                initialCameraPosition: provider.initialCameraPosition,
                markers: provider.markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                compassEnabled: true,
                onMapCreated: (controller) {
                  _mapController = controller;
                },
                onTap: (_) {
                  setState(() {
                    provider.clearSelectedLocation();
                    _bottomSheetHeight = 0;
                  });
                },
              ),
              
              // Search bar
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LocationSearchBar(),
              ),
              
              // Type filter
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: LocationTypeFilter(),
              ),
              
              // Location list and floor buttons
              Positioned(
                bottom: _bottomSheetHeight > 0 ? _bottomSheetHeight + 16 : 16,
                right: 16,
                child: Column(
                  children: [
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: AppColors.white,
                      onPressed: () {
                        _mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(provider.initialCameraPosition),
                        );
                      },
                      child: Icon(
                        Icons.my_location,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: AppColors.white,
                      onPressed: _showFloorSelector,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.layers,
                            color: AppColors.primary,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                provider.selectedFloor == "All Floors" ? "All" : provider.selectedFloor.substring(0, 1),
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      onPressed: _showLocationsList,
                      child: Icon(
                        Icons.list,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Bottom sheet for selected location
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: provider.selectedLocation != null ? 0 : -150,
                left: 0,
                right: 0,
                height: 150,
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.primaryDelta! > 0) {
                      // Dragging down
                      setState(() {
                        provider.clearSelectedLocation();
                        _bottomSheetHeight = 0;
                      });
                    } else if (details.primaryDelta! < 0) {
                      // Dragging up
                      _showLocationDetails();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: provider.selectedLocation != null
                              ? LocationCard(
                                  location: provider.selectedLocation!,
                                  onTap: _showLocationDetails,
                                )
                              : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  void _showLocationsList() {
    final provider = context.read<SchoolMapProvider>();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Locations (${provider.filteredLocations.length})",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: AppColors.darkGray,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: provider.filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = provider.filteredLocations[index];
                  return LocationCard(
                    location: location,
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        provider.selectLocation(location);
                        _bottomSheetHeight = 150;
                      });
                      
                      // Center map on selected location
                      _mapController?.animateCamera(
                        CameraUpdate.newLatLng(LatLng(location.latitude, location.longitude)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showLocationDetails() {
    final provider = context.read<SchoolMapProvider>();
    if (provider.selectedLocation == null) return;
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: LocationCard(
                  location: provider.selectedLocation!,
                  isDetailed: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showFloorSelector() {
    final provider = context.read<SchoolMapProvider>();
    final floorCounts = provider.getFloorCounts();
    
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.layers, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Text(
                    "Select Floor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ...provider.availableFloors.map((floor) => ListTile(
              selected: provider.selectedFloor == floor,
              selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
              leading: Icon(
                Icons.layers, 
                color: provider.selectedFloor == floor 
                    ? AppColors.primary 
                    : AppColors.darkGray,
              ),
              title: Text(floor),
              trailing: Text(
                "${floorCounts[floor] ?? 0} locations",
                style: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 12,
                ),
              ),
              onTap: () {
                provider.setSelectedFloor(floor);
                Navigator.pop(context);
                
                // If there are locations on this floor, animate to the first one
                final locationsOnFloor = provider.getLocationsByFloor(floor);
                if (locationsOnFloor.isNotEmpty && floor != "All Floors") {
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(
                        locationsOnFloor.first.latitude, 
                        locationsOnFloor.first.longitude
                      )
                    ),
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
  
  
  
  
} 