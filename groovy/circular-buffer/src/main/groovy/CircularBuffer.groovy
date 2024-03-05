class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {

    private def buffer
    private def length
    private def readIndex
    private def writeIndex

    CircularBuffer(int capacity) {
        buffer = new int[capacity]
        clear()
    }

    def clear() {
        length = 0
        readIndex = 0
        writeIndex = 0
    }

    def read() {
        if (length == 0) throw new EmptyBufferException()

        length -= 1

        def ret = buffer[readIndex]
        shiftReadIndex()
        ret
    }

    def write(int item) {
        if (length == buffer.size()) throw new FullBufferException()

        length += 1

        buffer[writeIndex] = item
        shiftWriteIndex()
    }

    def overwrite(int item) {
        if (length == buffer.size()) {
            shiftReadIndex()
        } else {
            length += 1
        }

        buffer[writeIndex] = item
        shiftWriteIndex()
    }

    private def shiftReadIndex() {
        readIndex = (readIndex + 1) % buffer.size()
    }

    private def shiftWriteIndex() {
        writeIndex = (writeIndex + 1) % buffer.size()
    }
}
