import 'package:cached_network_image/cached_network_image.dart';
import 'package:school_management/core/library/library.dart';
import 'package:school_management/core/utils/data_validator.dart';
import 'package:school_management/widgets/shimmer/image_shimmer.dart';

extension ImageExtension on String {
  Widget toImage({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    if (DataValidator.checkString(this)) {
      if (isImage()) {
        if (startsWith('http://') || startsWith('https://')) {
          return CachedNetworkImage(
            imageUrl: this,
            width: width,
            height: height,
            fit: fit,
            color: color,
            placeholder: (context, url) =>
                placeholder ??
                ImageShimmer(width: width ?? 100, height: height ?? 100),
            errorWidget: (context, url, error) =>
                errorWidget ??
                const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
          );
        } else if (endsWith('.svg')) {
          return SvgPicture.asset(
            this,
            width: width,
            height: height,
            fit: fit,
            colorFilter:
                color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
          );
        } else if (startsWith('/') || startsWith('file://')) {
          return Image.file(
            File(this),
            width: width,
            height: height,
            fit: fit,
          );
        } else {
          // Assume it's an asset image
          if (startsWith('assets')) {
            return Image.asset(
              this,
              width: width,
              height: height,
              fit: fit,
              color: color,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox();
              },
            );
          } else {
            return SizedBox();
          }
        }
      } else {
        if (isVideo()) {
          return SizedBox();
        } else {
          return SizedBox();
        }
      }
    } else {
      return SizedBox();
    }
  }
}

extension StringExtensions on String {
  /// Check if the string is an image file
  bool isImage() {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'svg'];
    return _hasExtension(imageExtensions);
  }

  /// Check if the string is a video file
  bool isVideo() {
    final videoExtensions = ['mp4', 'mkv', 'avi', 'mov', 'flv', 'wmv', 'webm'];
    return _hasExtension(videoExtensions);
  }

  /// Check if the string is a document file
  bool isDocument() {
    final documentExtensions = [
      'pdf',
      'doc',
      'docx',
      'ppt',
      'pptx',
      'xls',
      'xlsx',
      'txt'
    ];
    return _hasExtension(documentExtensions);
  }

  /// Check if the string is a valid URL
  bool isUrl() {
    final urlPattern = r'^(https?:\/\/)?([\w\-]+\.)+[\w\-]+(\/[\w\-]*)*\/?$';
    return RegExp(urlPattern).hasMatch(this);
  }

  /// Check if the string is a valid file path
  bool isFilePath() {
    return startsWith('/') || startsWith('file://');
    // final filePathPattern = r'^([a-zA-Z]:\\|\/)?([\w\-]+\/?)*[\w\-]+\.[\w\-]+$';
    // return RegExp(filePathPattern).hasMatch(this);
  }

  /// Private helper method to check for file extensions
  bool _hasExtension(List<String> extensions) {
    final lowerCased = toLowerCase();
    return extensions.any((ext) => lowerCased.endsWith('.$ext'));
  }
}

extension StringExtension on String {
  /// Removes the last character from the string
  String rm() {
    if (isEmpty) return this; // Return as-is if the string is empty
    if (endsWith('s') || endsWith("S")) {
      return substring(0, length - 1); // Remove the last character if it's 's'
    }
    return this; // Return the string as-is if the last character is not 's'
  }
}

String getFileExtension(String filePath) {
  if (!filePath.contains('.')) return ''; // Return empty if no extension found
  return filePath.split('.').last; // Get the part after the last dot
}
