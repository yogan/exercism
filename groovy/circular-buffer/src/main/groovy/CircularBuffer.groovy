class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {

    private def buffer
    private def capacity
    private def length
    private def readIndex
    private def writeIndex

    CircularBuffer(int capacity) {
        this.buffer = new int[capacity]
        this.capacity = capacity
        this.clear()
    }

    def clear() {
        this.length = 0
        this.readIndex = 0
        this.writeIndex = 0
    }

    def read() {
        if(this.length == 0) {
            throw new EmptyBufferException()
        }

        this.length -= 1

        def ret = this.buffer[this.readIndex]
        this.shiftReadIndex()
        return ret
    }

    def write(int item) {
        if (this.length == this.capacity) {
            throw new FullBufferException()
        }

        this.length += 1

        this.buffer[this.writeIndex] = item
        this.shiftWriteIndex()
    }

    def overwrite(int item) {
        if (this.length == this.capacity) {
            this.shiftReadIndex()
        } else {
            this.length += 1
        }

        this.buffer[this.writeIndex] = item
        this.shiftWriteIndex()
    }

    private def shiftReadIndex() {
        this.readIndex = (this.readIndex + 1) % this.capacity
    }

    private def shiftWriteIndex() {
        this.writeIndex = (this.writeIndex + 1) % this.capacity
    }
}
