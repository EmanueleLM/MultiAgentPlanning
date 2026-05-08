(define (problem trip_8_days)
  (:domain trip_planning)
  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 - count
  )
  (:init
    ;; Timeline definition
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ;; Counter definition
    (succ c0 c1)
    (succ c1 c2)
    (succ c2 c3)
    (succ c3 c4)

    ;; City connectivity (direct flights)
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)

    ;; Initial state
    ;; To fulfill the constraints, starting in London is required.
    (at london d1)
    (count london c0)
    (count bucharest c0)
    (count riga c0)
  )
  (:goal
    (and
      ;; Total stay requirements
      (count london c3)
      (count bucharest c3)
      (count riga c4)

      ;; Workshop in Riga between day 5 and day 8
      (visited riga d5)
      (visited riga d6)
      (visited riga d7)
      (visited riga d8)
      
      ;; Ensure trip is completed (at day 9 state)
      (at riga d9)
    )
  )
)