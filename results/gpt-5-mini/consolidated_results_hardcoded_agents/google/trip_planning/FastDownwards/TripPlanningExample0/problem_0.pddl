(define (problem travel-problem)
  (:domain travel-domain)
  (:objects
    florence barcelona helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Allocation decision (documented trade-offs):
  ; Original requested stays:
  ;  - Florence: 6 days (mandatory meeting between day9 and day14 inclusive)
  ;  - Barcelona: 5 days
  ;  - Helsinki: 5 days
  ; Total requested = 16 days, but only 14 days available.
  ; Priority: mandatory meeting window in Florence is honored first.
  ; Chosen feasible allocation (prioritising earliest feasible schedule and the meeting):
  ;  - Florence: 6 days  -> days 9..14  (meets meeting constraint)
  ;  - Barcelona: 4 days -> days 1..3 and day8
  ;  - Helsinki: 4 days  -> days 4..7
  ; This yields a 14-day itinerary (6 + 4 + 4 = 14).
  ; Trade-offs:
  ;  - Barcelona and Helsinki requested 5 days each but have been reduced to 4 each to fit the 14-day limit.
  ;  - Meeting constraint in Florence (day9..14) is strictly enforced and scheduled as days 9..14.
  ; The schedule respects only direct flights:
  ;  - Barcelona <-> Florence (used day8->day9 to arrive Florence on day9)
  ;  - Barcelona <-> Helsinki (used day3->day4 and day7->day8)
  ;  - No direct Florence<->Helsinki flights are used or allowed.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:init
    ;; successor relation for days (explicit day model)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; Direct flight connections (only allowed ones)
    (connected barcelona florence)
    (connected florence barcelona)
    (connected helsinki barcelona)
    (connected barcelona helsinki)

    ;; Starting location: earliest time prioritized -> start in Barcelona on day1
    (at barcelona day1)
  )

  ;; Goal: explicit assignment of each day to exactly one city via the trajectory
  (:goal (and
    ;; Barcelona days: day1, day2, day3, day8  (4 days)
    (at barcelona day1)
    (at barcelona day2)
    (at barcelona day3)
    (at barcelona day8)

    ;; Helsinki days: day4, day5, day6, day7 (4 days)
    (at helsinki day4)
    (at helsinki day5)
    (at helsinki day6)
    (at helsinki day7)

    ;; Florence days (meeting window enforced): day9..day14 (6 days)
    (at florence day9)
    (at florence day10)
    (at florence day11)
    (at florence day12)
    (at florence day13)
    (at florence day14)
  ))
)