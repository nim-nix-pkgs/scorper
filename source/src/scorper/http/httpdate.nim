import times
import httpcore
proc httpDate*(datetime: DateTime): string =
  ## Returns ``datetime`` formated as HTTP full date (RFC-822).
  ## ``Note``: ``datetime`` must be in UTC/GMT zone.
  result = datetime.format(HttpDateFormat)

proc httpDate*(t: Time): string =
  ## Returns ``datetime`` formated as HTTP full date (RFC-822).
  ## ``Note``: ``datetime`` must be in UTC/GMT zone.
  result = t.format(HttpDateFormat)

proc httpDate*(): string {.inline.} =
  ## Returns current datetime formatted as HTTP full date (RFC-822).
  result = utc(now()).httpDate()

when isMainModule:
  echo parseTime("Wed, 21 Oct 2015 07:28:00 GMT", HttpDateFormat, utc()).utc
