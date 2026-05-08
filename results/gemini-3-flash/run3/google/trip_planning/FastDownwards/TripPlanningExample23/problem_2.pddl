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

    ;; City tallies at 0
    (tally london s0)
    (tally bucharest s0)
    (tally riga s0)

    ;; Temporal succession (8-day limit)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)

    ;; Tally succession (up to 4 days)
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)

    ;; Direct flight connections
    (connected london bucharest)
    (connected bucharest london)
    (connected bucharest riga)
    (connected riga bucharest)
  )

  (:goal
    (and
      ;; Must stay in London for 3 days
      (tally london s3)
      
      ;; Must stay in Bucharest for 3 days
      (tally bucharest s3)
      
      ;; Must stay in Riga for 4 days
      (tally riga s4)

      ;; Workshop in Riga between day 5 and day 8 (inclusive)
      (day_counted riga d5)
      (day_counted riga d6)
      (day_counted riga d7)
      (day_counted riga d8)
    )
  )
)