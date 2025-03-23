import 'package:flutter/material.dart';
import 'package:school_management/features/gallery/model/gallery_model.dart';
import 'package:school_management/widgets/common/text_widget.dart';

class ImageViewer extends StatefulWidget {
  final GalleryModel gallery;
  
  const ImageViewer({
    super.key,
    required this.gallery,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  TransformationController _transformationController = TransformationController();

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withValues(alpha:0.5),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              widget.gallery.title,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              widget.gallery.date,
              color: Colors.white70,
              fontSize: 12,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Image with zoom
          InteractiveViewer(
            transformationController: _transformationController,
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: Image.asset(
                widget.gallery.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported,
                          color: Colors.grey.shade400,
                          size: 64,
                        ),
                        const SizedBox(height: 16),
                        const TextWidget(
                          "Image could not be loaded",
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Description at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(widget.gallery.category).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextWidget(
                          widget.gallery.category,
                          fontSize: 12,
                          color: _getCategoryColor(widget.gallery.category),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextWidget(
                    widget.gallery.description,
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 14,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          
          // Reset zoom button
          Positioned(
            right: 16,
            top: 16,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black.withValues(alpha: 0.5),
              onPressed: () {
                _transformationController.value = Matrix4.identity();
              },
              child: const Icon(Icons.zoom_out_map, color: Colors.white),
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