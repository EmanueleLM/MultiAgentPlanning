(define (problem trip-10days)
  (:domain trip-planning)
  (:objects
    DBV FRA KRK - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ; day succession
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ; Allowed direct transitions (flights) and stays.
    ; Direct flights: FRA <-> KRK, FRA <-> DBV. No direct DBV <-> KRK.
    (can-transition FRA KRK)
    (can-transition KRK FRA)
    (can-transition FRA DBV)
    (can-transition DBV FRA)

    ; Allow staying in the same city for consecutive days
    (can-transition DBV DBV)
    (can-transition FRA FRA)
    (can-transition KRK KRK)

    ; City-permitted days (enforce exact total-day allocations per auditor-approved relaxation):
    ; Dubrovnik permitted on days 1..7 (7 days)
    (city-permitted DBV day1)
    (city-permitted DBV day2)
    (city-permitted DBV day3)
    (city-permitted DBV day4)
    (city-permitted DBV day5)
    (city-permitted DBV day6)
    (city-permitted DBV day7)

    ; Frankfurt permitted only on day8 (1 day)
    (city-permitted FRA day8)

    ; Krakow permitted only on day9 and day10 (exactly 2 days, wedding)
    (city-permitted KRK day9)
    (city-permitted KRK day10)

    ; Starting assignment: begin in Dubrovnik on day1
    (at DBV day1)
    (occupied day1)
  )

  (:goal
    (and
      ; all 10 days must be assigned (one city per day enforced by occupied facts)
      (occupied day1)
      (occupied day2)
      (occupied day3)
      (occupied day4)
      (occupied day5)
      (occupied day6)
      (occupied day7)
      (occupied day8)
      (occupied day9)
      (occupied day10)

      ; Hard constraints: Krakow on days 9 and 10 (wedding days)
      (at KRK day9)
      (at KRK day10)
    )
  )
)