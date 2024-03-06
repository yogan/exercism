class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {

  private val buffer     = Array.ofDim[Int](capacity)
  private var items      = 0
  private var readIndex  = 0
  private var writeIndex = 0

  def clear() = {
    items      = 0
    readIndex  = 0
    writeIndex = 0
  }

  def read(): Int = {
    if (isEmpty) throw new EmptyBufferException()
    decreaseItems()
    readFromBuffer()
  }

  def write(value: Int) = {
    if (isFull) throw new FullBufferException()
    increaseItems()
    writeToBuffer(value)
  }

  def overwrite(value: Int) = {
    if (isFull) shiftReadIndex() else increaseItems()
    writeToBuffer(value)
  }

  private def readFromBuffer() = {
    val value = buffer(readIndex)
    shiftReadIndex()
    value
  }

  private def writeToBuffer(value: Int) = {
    buffer.update(writeIndex, value)
    shiftWriteIndex()
  }

  private def isEmpty = items == 0
  private def isFull  = items == buffer.size

  private def decreaseItems() = items -= 1
  private def increaseItems() = items += 1

  private def shiftReadIndex()  = readIndex  = (readIndex  + 1) % buffer.size
  private def shiftWriteIndex() = writeIndex = (writeIndex + 1) % buffer.size

}
