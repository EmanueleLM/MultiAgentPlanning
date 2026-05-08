(define (problem trip_23)
  (:domain trip_planning)
  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    s0 s1 s2 s3 s4 - step
  )

  (:init
    ;; Starting point
    (is_at london d1)

    ;; Temporal sequence for the 8-day trip
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)

    ;; Symbolic counting steps for stay durations
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)

    ;; Direct flight connections (bidirectional)
    (connected london bucharest)
    (connected bucharest london)
    (connected bucharest riga)
    (connected riga bucharest)

    ;; Initial tally for each city
    (tally london s0)
    (tally bucharest s0)
    (tally riga s0)
  )

  (:goal
    (and
      ;; 3 days in London
      (tally london s3)
      
      ;; 3 days in Bucharest
      (tally bucharest s3)
      
      ;; 4 days in Riga
      (tally riga s4)
      
      ;; Workshop in Riga between Day 5 and Day 8 (inclusive)
      (day_counted riga d5)
      (day_counted riga d6)
      (day_counted riga d7)
      (day_counted riga d8)
    )
  )
)