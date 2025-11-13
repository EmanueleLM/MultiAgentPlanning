(define (problem tripplanningexample23-problem)
  (:domain tripplanningexample23)
  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )
  (:init
    (current-day d1)
    (at london)
    (visited london)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (workshop-day d5)
    (workshop-day d6)
    (workshop-day d7)
    (workshop-day d8)

    (is-riga riga)
  )
  (:goal (and
    (current-day d9)
    (visited london)
    (visited bucharest)
    (visited riga)
  ))
)