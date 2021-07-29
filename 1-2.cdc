pub struct Canvas {

  pub let width: UInt8
  pub let height: UInt8
  pub let pixels: String

  init(width: UInt8, height: UInt8, pixels: String) {
    self.width = width
    self.height = height
    self.pixels = pixels
  }
}

pub resource Picture {
  pub let canvas: Canvas
  
  init(canvas: Canvas) {
    self.canvas = canvas
  }

}

pub resource Printer {
  pub let canvasList: [string]

  pub fun print(canvas: Canvas): @Picture? {
    if !self.canvasList.contains(canvas.pixels) && canvas.height == 5 && canvas.width == 5 {
      log("Unique and valid size")
      self.canvasList.append(canvas.pixels)
      display(canvas: canvas)
      return <-create Picture(canvas: canvas)   
    }
  log ("Not unique or invalid size")
  return nil
}

init() {
  self.canvasList = []
}

pub fun serializeStringArray(_ lines: [String]): String {
  var buffer= ""
  for line in lines {
    buffer = buffer.concat(line)
  }

  return buffer
}

pub fun display(_ canvas: Canvas) {
  var rowID = 0
  log("Length: ".concat(canvas.height.toString()))
  while rowID < Ubt(canvas.height) {
    log(canvas.pixels.slice(from: Int(canvas.height)*rowID, upTo: Int(canvas.height)*rowID + Int(canvas.height)))
    rowID = rowID +1
  }

}
pub fun main() {
  let pixelsX = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
  ]

let canvasX = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixelsX)
)

  pub fun print(canvas: Canvas): @Picture? {
    let letterX <- create Picture(canvas: canvas)
    log(letterX.canvas)
    return <-letterX
  }
}

/// Lost in the weeds


pub resource Printer {
  pub let prints: {String: Canvas}

  init() {
    self.prints = {}
}

pub fun print(canvas: Canvas): @Picture? {
  if !self.prints.containsKey(key: canvas.pixels) {
    let picture <- create Picture(canvas: canvas)
    self.prints[canvas.pixels] = canvas

    return <- picture
    } else {
      return nil
    }
  }
}

pub fun serializeStringArray(_ lines: [String]):
}


  displayCanvas(canvas)
  return nil
  }
}

//interrupted and lost train of thought