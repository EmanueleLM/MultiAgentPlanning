(define (problem trip_planning_example24_problem)
  (:domain trip_planning_example24)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (at florence)

    (current_day d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)
    (last_day d13)

    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

    (in_florence_window d1)
    (in_florence_window d2)
    (in_florence_window d3)
    (in_florence_window d4)
  )

  (:goal
    (and
      (workshop_attended)
      (trip_finished)
      (visited_florence_on d1)
      (visited_florence_on d2)
      (visited_florence_on d3)
      (visited_florence_on d4)
      (visited_amsterdam_on d5)
      (visited_amsterdam_on d6)
      (visited_amsterdam_on d7)
      (visited_amsterdam_on d8)
      (visited_amsterdam_on d9)
      (visited_amsterdam_on d10)
      (visited_riga_on d11)
      (visited_riga_on d12)
      (visited_riga_on d13)
    )
  )
)