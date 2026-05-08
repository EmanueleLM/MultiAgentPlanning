(define (problem tripplanningexample23_problem)
  (:domain tripplanningexample23)

  (:objects
    london bucharest riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (at london)
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (stay_slot london day_1)
    (stay_slot london day_2)
    (flight_slot london bucharest day_3)
    (stay_slot bucharest day_4)
    (flight_slot bucharest riga day_5)
    (stay_slot riga day_6)
    (stay_slot riga day_7)
    (stay_slot riga day_8)
  )

  (:goal
    (and
      (current_day day_9)
      (at riga)
      (occupied london day_1)
      (occupied london day_2)
      (occupied bucharest day_3)
      (occupied bucharest day_4)
      (occupied riga day_5)
      (occupied riga day_6)
      (occupied riga day_7)
      (occupied riga day_8)
    )
  )
)