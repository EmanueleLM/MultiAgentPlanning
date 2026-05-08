(define (problem trip_instance)
  (:domain trip_planning)
  (:objects
    paris istanbul salzburg - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    s0 s1 s2 s3 s4 s5 s6 s7 - step
  )

  (:init
    (at paris)
    (current_day d1)
    (count paris s0)
    (count istanbul s0)
    (count salzburg s0)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)
    (next_step s4 s5)
    (next_step s5 s6)
    (next_step s6 s7)
    (has_flight paris istanbul)
    (has_flight istanbul paris)
    (has_flight istanbul salzburg)
    (has_flight salzburg istanbul)
  )

  (:goal (and
    (current_day d8)
    (stayed_at paris d1)
    (stayed_at paris d2)
    (count paris s2)
    (count istanbul s2)
    (count salzburg s5)
  ))
)