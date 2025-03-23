import 'package:school_management/core/library/library.dart';
import 'package:school_management/features/school_map/provider/school_map_provider.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key});

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    
    // Initialize with current search query if any
    _searchController.text = context.read<SchoolMapProvider>().searchQuery;
    
    // Listen for changes to perform search
    _searchController.addListener(_onSearchChanged);
  }
  
  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
  
  void _onSearchChanged() {
    context.read<SchoolMapProvider>().searchLocations(_searchController.text);
  }
  
  void _clearSearch() {
    _searchController.clear();
    context.read<SchoolMapProvider>().searchLocations('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(
            Icons.search,
            color: AppColors.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search locations...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: AppColors.darkGray.withValues(alpha: 0.7),
                ),
              ),
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            GestureDetector(
              onTap: _clearSearch,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.clear,
                  color: AppColors.darkGray,
                  size: 20,
                ),
              ),
            ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
} 