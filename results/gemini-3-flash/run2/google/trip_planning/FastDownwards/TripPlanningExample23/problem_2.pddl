(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    n0 n1 n2 n3 n4 - count
  )
  (:init
    ;; Starting configuration: Traveler begins in London on Day 1.
    (at_city london)
    (at_day d1)

    ;; Stay counters initialized to zero.
    (stay_count london n0)
    (stay_count bucharest n0)
    (stay_count riga n0)

    ;; Timeline structure for 8 days (d1 to d8, finishing at d9).
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Count increments for tracking stay durations.
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)

    ;; City connectivity via direct flights.
    (can_fly london bucharest)
    (can_fly bucharest london)
    (can_fly bucharest riga)
    (can_fly riga bucharest)
  )
  (:goal
    (and
      ;; The trip must span exactly 8 days.
      (at_day d9)

      ;; Duration constraints for each city.
      ;; London: 3 days, Bucharest: 3 days, Riga: 4 days.
      (stay_count london n3)
      (stay_count bucharest n3)
      (stay_count riga n4)

      ;; Temporal constraint: Workshop in Riga from Day 5 to Day 8.
      (visited riga d5)
      (visited riga d6)
      (visited riga d7)
      (visited riga d8)
    )
  )
)