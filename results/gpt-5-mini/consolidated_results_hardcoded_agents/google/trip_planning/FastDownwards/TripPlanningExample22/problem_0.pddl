; Problem: 11-day itinerary (Fast Downward compatible)
; Encoded assumptions (repeated for clarity):
; - Resolved allocation: berlin 5 days (days 1-5), frankfurt 4 days (days 6-9), bucharest 2 days (days 10-11).
; - Start in Berlin on day1 to ensure early attendance to the Berlin show (days 1..7).
; - Direct flights only as specified (berlin<->frankfurt, frankfurt<->bucharest).
(define (problem itinerary-11days)
  (:domain itinerary)

  (:objects
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ; Temporal successor relations
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)

    ; Direct flight connectivity (explicit, symmetric where available)
    (connected berlin frankfurt)
    (connected frankfurt berlin)
    (connected frankfurt bucharest)
    (connected bucharest frankfurt)

    ; Initial occupancy: start in Berlin on day1
    (at berlin day1)
    (occupied day1)

    ; All other days are initially unoccupied (implicit by absence of occupied facts)
    ; No other (at ...) facts are present initially.
  )

  ; Goal: assign each day to a city such that city-stay totals equal:
  ;   berlin = 5 (days 1-5)
  ;   frankfurt = 4 (days 6-9)
  ;   bucharest = 2 (days 10-11)
  ; This allocation sums to 11 days and satisfies attendance at Berlin during days 1..7.
  (:goal
    (and
      ; Berlin days 1-5
      (at berlin day1) (at berlin day2) (at berlin day3) (at berlin day4) (at berlin day5)

      ; Frankfurt days 6-9
      (at frankfurt day6) (at frankfurt day7) (at frankfurt day8) (at frankfurt day9)

      ; Bucharest days 10-11
      (at bucharest day10) (at bucharest day11)
    )
  )
)