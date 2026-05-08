(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
    n0 n1 n2 n3 - count
  )

  (:init
    ;; Starting conditions: Day 1 in Berlin
    (at berlin)
    (current_day d1)
    (visited berlin d1)
    (stay_count berlin n1)
    (stay_count warsaw n0)
    (stay_count bucharest n0)

    ;; Day sequencing
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)

    ;; Count sequencing
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)

    ;; Flight connections
    (connected berlin warsaw)
    (connected warsaw berlin)
    (connected warsaw bucharest)
    (connected bucharest warsaw)
  )

  (:goal (and
    ;; Final day of the trip
    (current_day d6)

    ;; Stay duration requirements
    (stay_count berlin n3)
    (stay_count warsaw n3)
    (stay_count bucharest n2)

    ;; Meeting the friend in Bucharest between Day 5 and Day 6
    (visited bucharest d5)
    (visited bucharest d6)
  ))
)