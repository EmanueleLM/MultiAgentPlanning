(define (problem tripplanningexample31_problem)
  (:domain tripplanningexample31)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at split)
    (current_day d1)

    (direct frankfurt reykjavik)
    (direct reykjavik frankfurt)
    (direct frankfurt split)
    (direct split frankfurt)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)

    (workshop_day d8)
    (workshop_day d9)
    (workshop_day d10)
  )

  (:goal
    (and
      (current_day d11)
      (visited_frankfurt)
      (visited_reykjavik)
      (visited_split)
      (workshop_attended)

      (in_frankfurt_on d1)
      (in_frankfurt_on d2)

      (in_reykjavik_on d3)
      (in_reykjavik_on d8)
      (in_reykjavik_on d9)

      (in_split_on d4)
      (in_split_on d5)
      (in_split_on d6)
      (in_split_on d7)
      (in_split_on d10)

      (not (in_frankfurt_on d3))
      (not (in_frankfurt_on d4))
      (not (in_frankfurt_on d5))
      (not (in_frankfurt_on d6))
      (not (in_frankfurt_on d7))
      (not (in_frankfurt_on d8))
      (not (in_frankfurt_on d9))
      (not (in_frankfurt_on d10))

      (not (in_reykjavik_on d1))
      (not (in_reykjavik_on d2))
      (not (in_reykjavik_on d4))
      (not (in_reykjavik_on d5))
      (not (in_reykjavik_on d6))
      (not (in_reykjavik_on d7))
      (not (in_reykjavik_on d10))

      (not (in_split_on d1))
      (not (in_split_on d2))
      (not (in_split_on d3))
      (not (in_split_on d8))
      (not (in_split_on d9))
    )
  )
)