#import "generic.typ": _generic

/// - data (str, bytes):
/// - options (dictionary):
/// - quiet-zone (int, bool, none):
/// - width (auto, length):
/// - height (auto, length):
/// - module-size (auto, length):
/// - fill (color, gradient):
/// - background-fill (none, color, gradient):
/// -> content
#let datamatrix(
  data,
  options: (:),
  quiet-zone: 0,
  width: auto,
  height: auto,
  module-size: auto,
  fill: black,
  background-fill: none,
) = _generic(
  data,
  "datamatrix",
  options: options,
  quiet-zone: quiet-zone,
  width: width,
  height: height,
  module-size: module-size,
  fill: fill,
  background-fill: background-fill,
)

/// - data (str, bytes):
/// - options (dictionary):
/// - quiet-zone (int, bool, none):
/// - width (auto, length):
/// - height (auto, length):
/// - module-size (auto, length):
/// - fill (color, gradient):
/// - finder-fill (auto, color, gradient):
/// - background-fill (none, color, gradient):
/// -> content
#let qrcode(
  data,
  options: (:),
  quiet-zone: 0,
  width: auto,
  height: auto,
  module-size: auto,
  fill: black,
  finder-fill: auto,
  background-fill: none,
) = _generic(
  data,
  "qrcode",
  options: options,
  quiet-zone: quiet-zone,
  width: width,
  height: height,
  module-size: module-size,
  fill: fill,
  finder-fill: finder-fill,
  background-fill: background-fill,
  default-quiet-zone: 4,
  // Micro QR codes (at most 17 modules wide) have a single finder pattern, Model 2 codes have three.
  finder-patterns: size => if size < 21 { ((0, 0),) } else {
    ((0, 0), (size - 7, 0), (0, size - 7))
  },
)
