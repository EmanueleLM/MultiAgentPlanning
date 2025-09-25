(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    oslo dublin valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (at oslo)
    (current d1)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10)
    (in-relatives-window d5) (in-relatives-window d6)
    (in-relatives-window d7) (in-relatives-window d8)
    (in-relatives-window d9)
    (= (oslo-count) 0)
    (= (dublin-count) 0)
    (= (valencia-count) 0)
  )
  (:goal
    (and
      (= (oslo-count) 3)
      (= (valencia-count) 5)
      (= (dublin-count) 3)
      (relatives-visited)
      (current d10)
    )
  )
)