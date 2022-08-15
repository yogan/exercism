import java.time.LocalDate
import java.time.LocalDateTime

private const val GIGA: Long = 1_000_000_000

class Gigasecond(time: LocalDateTime) {

    constructor(date: LocalDate) : this(date.atStartOfDay())

    val date: LocalDateTime = time.plusSeconds(GIGA)
}
