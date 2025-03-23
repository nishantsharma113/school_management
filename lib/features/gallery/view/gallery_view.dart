import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/features/gallery/model/gallery_model.dart';
import 'package:school_management/features/gallery/provider/gallery_provider.dart';
import 'package:school_management/features/gallery/widgets/category_filter.dart';
import 'package:school_management/features/gallery/widgets/gallery_card.dart';
import 'package:school_management/features/gallery/widgets/image_viewer.dart';
import 'package:school_management/widgets/common/custom_app_bar.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GalleryProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Gallery",
        showtitle: true,
      ),
      body: Consumer<GalleryProvider>(
        builder: (context, galleryProvider, child) {
          if (galleryProvider.galleryList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final filteredGallery = galleryProvider.getFilteredGallery();
          
          return Column(
            children: [
              // Category Filter
              CategoryFilter(
                categories: galleryProvider.categoryList,
                selectedCategory: galleryProvider.selectedCategory,
                onCategorySelected: (category) {
                  galleryProvider.setSelectedCategory(category);
                },
              ),
              
              // Gallery List
              Expanded(
                child: filteredGallery.isEmpty 
                  ? const Center(
                      child: Text("No items found in this category"),
                    )
                  : ListView.builder(
                      itemCount: filteredGallery.length,
                      padding: const EdgeInsets.only(bottom: 16),
                      itemBuilder: (context, index) {
                        final gallery = filteredGallery[index];
                        return GalleryCard(
                          gallery: gallery,
                          onTap: () {
                            galleryProvider.toggleExpanded(index);
                          },
                          onImageTap: () {
                            _showFullScreenImage(context, gallery);
                          },
                        );
                      },
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  void _showFullScreenImage(BuildContext context, GalleryModel gallery) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImageViewer(gallery: gallery),
      ),
    );
  }
} 