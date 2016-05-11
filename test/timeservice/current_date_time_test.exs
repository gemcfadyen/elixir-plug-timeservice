defmodule CurrentDateTimeTest do
  use ExUnit.Case

  test "converts current time into readable format" do
    {{year, month, day}, {hour, minutes, seconds}} = :calendar.local_time
    current = CurrentDateTime.get

    assert current.year == year
    assert current.month == month
    assert current.day == day
    assert current.hour == hour
    assert current.minutes == minutes
    assert current.seconds == seconds
  end
end
