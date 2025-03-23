import 'package:flutter/material.dart';
import 'package:school_management/features/gallery/model/gallery_model.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class GalleryCard extends StatelessWidget {
  final GalleryModel gallery;
  final VoidCallback onTap;
  final VoidCallback? onImageTap;
  
  const GalleryCard({
    super.key,
    required this.gallery,
    required this.onTap,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          GestureDetector(
            onTap: onImageTap ?? onTap,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                gallery.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey.shade200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            color: Colors.grey.shade400,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          const TextWidget(
                            "Image not available",
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Header
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextWidget(
                          gallery.title,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(gallery.category).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextWidget(
                          gallery.category,
                          fontSize: 12,
                          color: _getCategoryColor(gallery.category),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 8),
                      TextWidget(
                        gallery.date,
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                      const Spacer(),
                      Icon(
                        gallery.isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Description (visible when expanded)
          if (gallery.isExpanded)
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  TextWidget(
                    gallery.description,
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    textAlign: TextAlign.justify,
                    maxLines: 20,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
  
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Events':
        return Colors.blue;
      case 'Sports':
        return Colors.green;
      case 'Classroom':
        return Colors.orange;
      case 'Cultural':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
} 