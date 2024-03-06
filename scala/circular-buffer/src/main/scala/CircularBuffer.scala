class EmptyBufferException() extends Exception {}

class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {

  private val buffer     = Array.ofDim[Int](capacity)
  private var size       = capacity
  private var items      = 0
  private var readIndex  = 0
  private var writeIndex = 0

  def clear() = {
    items      = 0
    readIndex  = 0
    writeIndex = 0
  }

  def read(): Int = {
    if (items == 0) throw new EmptyBufferException()

    decreaseItems()

    val value = buffer(readIndex)
    shiftReadIndex()
    value
  }

  def write(value: Int) = {
    if (items == size) throw new FullBufferException()

    increaseItems()

    buffer.update(writeIndex, value)
    shiftWriteIndex()
  }

  def overwrite(value: Int) = {
    if (items == size) shiftReadIndex() else increaseItems()

    buffer.update(writeIndex, value)
    shiftWriteIndex()
  }

  private def decreaseItems() = items -= 1
  private def increaseItems() = items += 1

  private def shiftReadIndex()  = readIndex  = (readIndex  + 1) % size
  private def shiftWriteIndex() = writeIndex = (writeIndex + 1) % size

}
