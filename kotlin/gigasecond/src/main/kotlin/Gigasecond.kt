import java.time.LocalDate
import java.time.LocalDateTime

private const val GIGA: Long = 1_000_000_000

class Gigasecond {

    constructor(date: LocalDate) {
        this.date = date.atStartOfDay().plusSeconds(GIGA)
    }

    constructor(time: LocalDateTime) {
        this.date = time.plusSeconds(GIGA)
    }

    val date: LocalDateTime
}
