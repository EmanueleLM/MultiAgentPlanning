; Problem: itinerary-problem
; Notes/assumptions (encoded as comments inside the problem):
; - Start: Split on day1 (encoded in :init).
; - Direct flights available (only those listed below).
; - The traveler must produce a 15-day itinerary that visits Split, Manchester, and Riga using only direct flights.
; - "Prioritise the earliest time" is enforced as hard constraints: Manchester must be visited on day2 and Riga on day3.
(define (problem itinerary-problem)
  (:domain itinerary-domain)

  (:objects
    split manchester riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ; direct-flight network (only these edges are available)
    (direct split manchester)
    (direct manchester riga)

    ; day ordering
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15)

    ; initial location and allocation
    (at split day1)
    (visited split)
    (day-allocated day1)
  )

  (:goal
    (and
      ; Required visits with earliest possible timing encoded as hard constraints:
      (at manchester day2)
      (at riga day3)

      ; All 15 days must be allocated (traveler is somewhere each day)
      (day-allocated day1) (day-allocated day2) (day-allocated day3)
      (day-allocated day4) (day-allocated day5) (day-allocated day6)
      (day-allocated day7) (day-allocated day8) (day-allocated day9)
      (day-allocated day10) (day-allocated day11) (day-allocated day12)
      (day-allocated day13) (day-allocated day14) (day-allocated day15)

      ; Ensure the three target cities are visited at least once
      (visited split) (visited manchester) (visited riga)
    )
  )
)