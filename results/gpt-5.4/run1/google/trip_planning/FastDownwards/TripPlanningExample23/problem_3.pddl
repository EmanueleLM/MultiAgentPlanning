(define (problem tripplanningexample23_problem)
  (:domain tripplanningexample23)

  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (workshop_day d5)
    (workshop_day d6)
    (workshop_day d7)
    (workshop_day d8)

    (current d1)
  )

  (:goal
    (and
      (spent d1 london)
      (spent d2 london)
      (spent d3 london)

      (spent d4 bucharest)
      (spent d5 bucharest)
      (spent d6 bucharest)

      (spent d5 riga)
      (spent d6 riga)
      (spent d7 riga)
      (spent d8 riga)

      (attended_workshop)
    )
  )
)