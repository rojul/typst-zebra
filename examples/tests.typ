#import "../src/lib.typ": datamatrix, qrcode

#set page(width: auto, height: auto, margin: 1em, fill: luma(80%))
#set text(font: "DejaVu Sans Mono", size: 10pt, fill: luma(20%))
#set rect(inset: 0.5pt, stroke: luma(67%))

#let case(name: "", ..content) = {
  stack(
    spacing: 0.5em,
    name,
    stack(
      dir: ltr,
      spacing: 0.5em,
      ..content.pos().map(rect),
    ),
  )
}
#let repeat(element, n) = range(0, n).map(_ => element)

#case(
  name: "data: \"0\"",
  datamatrix("0"),
  qrcode("0"),
)
#case(
  name: "data: bytes(\"ä\")",
  datamatrix(bytes("ä")),
  qrcode(bytes("ä")),
)
#case(
  name: "data: \"ä\"",
  datamatrix("ä"),
  qrcode("ä"),
)

#case(
  name: "options: (unknown: none)",
  datamatrix("0", options: (unknown: none)),
)

#case(
  name: "quiet-zone: true",
  datamatrix("0", quiet-zone: true),
  qrcode("0", quiet-zone: true),
)
#case(
  name: "quiet-zone: 4 | 1",
  datamatrix("0", quiet-zone: 4),
  qrcode("0", quiet-zone: 1),
)
#case(
  name: "quiet-zone: false | none | 0",
  datamatrix("0", quiet-zone: false),
  datamatrix("0", quiet-zone: none),
  datamatrix("0", quiet-zone: 0),
)

#case(
  name: "width: 5em",
  datamatrix("0", width: 5em),
  datamatrix("0" * 100, width: 5em),
  datamatrix("0", options: (symbols: "rect"), width: 5em),
)
#case(
  name: "height: 5em",
  datamatrix("0", height: 5em),
  datamatrix("0" * 100, height: 5em),
  datamatrix("0", options: (symbols: "rect"), height: 5em),
)
#case(
  name: "module-size: 0.1em | 0.2em",
  datamatrix("0", module-size: 0.1em),
  datamatrix("0" * 100, module-size: 0.1em),
  datamatrix("0", options: (symbols: "rect"), module-size: 0.1em),
  datamatrix("0", module-size: 0.2em),
  datamatrix("0" * 100, module-size: 0.2em),
  datamatrix("0", options: (symbols: "rect"), module-size: 0.2em),
)

#case(
  name: "fill: white | black | rainbow",
  datamatrix("0", fill: white),
  datamatrix("0", fill: black),
  datamatrix("0", fill: gradient.conic(..color.map.rainbow)),
)
#case(
  name: "background-fill: white | rainbow",
  datamatrix("0", background-fill: white),
  datamatrix("0", background-fill: gradient.conic(..color.map.rainbow)),
)
#case(
  name: "background-fill: none",
  datamatrix("0", background-fill: none),
)
#case(
  name: "background-fill + quiet-zone",
  datamatrix("0", quiet-zone: true, background-fill: white),
  datamatrix("0", quiet-zone: 4, background-fill: white),
)
#case(
  name: "background-fill + fill",
  datamatrix("0", fill: black, background-fill: white),
  datamatrix("0", fill: luma(40%), background-fill: luma(60%)),
  datamatrix(
    "0",
    fill: gradient.conic(..color.map.rainbow),
    background-fill: gradient.conic(..color.map.rainbow, angle: 180deg),
  ),
)

#case(
  name: "data: \"1\" * 1000",
  datamatrix("1" * 1000),
  qrcode("1" * 1000),
)
#case(
  name: "data: bytes(repeat(255, 1000))",
  datamatrix(bytes(repeat(255, 1000))),
  qrcode(bytes(repeat(255, 1000))),
)

#case(
  name: "align(*)",
  ..(left + top, center + horizon, right + bottom)
    .map(alignment => (
      align(alignment, datamatrix("0")),
      align(alignment, datamatrix("0", quiet-zone: 4)),
    ))
    .flatten(),
)

= datamatrix

#case(
  name: "encodation-type: none | ascii | base256",
  datamatrix("0" * 16),
  datamatrix("0" * 16, options: (encodation-type: "ascii")),
  datamatrix("0" * 16, options: (encodation-type: "base256")),
)
#case(
  name: "encodation-type: base256, data: \"0\" * 16 | bytes(repeat(255, 16))",
  datamatrix("0" * 16, options: (encodation-type: "base256")),
  datamatrix(bytes(repeat(255, 16)), options: (encodation-type: "base256")),
)

#case(
  name: "symbols: rect | rect-8 | rect-ext | rect-ext-8 | rect-16 | rect-ext-26",
  datamatrix("0", options: (symbols: "rect")),
  datamatrix("0", options: (symbols: "rect-8")),
  datamatrix("0", options: (symbols: "rect-ext")),
  datamatrix("0", options: (symbols: "rect-ext-8")),
  datamatrix("0", options: (symbols: "rect-16")),
  datamatrix("0", options: (symbols: "rect-ext-26")),
)
#case(
  name: "symbols: rect-8 | rect-ext-8 | rect | rect-ext, data: 0*",
  datamatrix("0" * 8, options: (symbols: "rect-8")),
  datamatrix("0" * 61, options: (symbols: "rect-ext-8")),
  datamatrix("0" * 47, options: (symbols: "rect")),
  datamatrix("0" * 116, options: (symbols: "rect-ext")),
)

= qrcode

#case(
  name: "versions: micro, data: 0*, ec-level: l",
  qrcode("0", options: (versions: "micro", ec-level: "l")),
  qrcode("0" * 6, options: (versions: "micro", ec-level: "l")),
  qrcode("0" * 11, options: (versions: "micro", ec-level: "l")),
)
#case(
  name: "versions: micro, data: A*, ec-level: l",
  qrcode("A", options: (versions: "micro", ec-level: "l")),
  qrcode("A" * 7, options: (versions: "micro", ec-level: "l")),
  qrcode("A" * 15, options: (versions: "micro", ec-level: "l")),
)
#case(
  name: "versions: micro, data: 0, ec-level: l | m | q",
  qrcode("0", options: (versions: "micro", ec-level: "l")),
  qrcode("0", options: (versions: "micro", ec-level: "m")),
  qrcode("0", options: (versions: "micro", ec-level: "q")),
)

#case(
  name: "mode: none | numeric | byte",
  qrcode("0" * 16),
  qrcode("0" * 16, options: (mode: "numeric")),
  qrcode("0" * 16, options: (mode: "byte")),
)
#case(
  name: "mode: byte, data: \"0\" * 16 | bytes(repeat(255, 16))",
  qrcode("0" * 16, options: (mode: "byte")),
  qrcode(bytes(repeat(255, 16)), options: (mode: "byte")),
)

#case(
  name: "finder-fill: red | rainbow, versions: normal | micro",
  qrcode("0", finder-fill: red),
  qrcode("0" * 100, finder-fill: red),
  qrcode("0", options: (versions: "micro"), finder-fill: red),
  qrcode("0", fill: luma(40%), finder-fill: gradient.conic(..color.map.rainbow)),
)
#case(
  name: "finder-fill + quiet-zone + background-fill",
  qrcode("0", quiet-zone: true, background-fill: white, finder-fill: red),
  qrcode("0", quiet-zone: 1, background-fill: white, finder-fill: red),
)

#case(
  name: "ec-level: l | m | q | h",
  qrcode("0" * 35, options: (ec-level: "l")),
  qrcode("0" * 35, options: (ec-level: "m")),
  qrcode("0" * 35, options: (ec-level: "q")),
  qrcode("0" * 35, options: (ec-level: "h")),
)
