(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    oslo dublin valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    ;; Start location and starting day
    (at oslo)
    (day d1)

    ;; Day successor chain up to d10 (d10 marks completion after 9 full days)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10)

    ;; Relatives visit window: must visit relatives in Valencia between day 5 and day 9 inclusive
    (in-relatives-window d5) (in-relatives-window d6)
    (in-relatives-window d7) (in-relatives-window d8)
    (in-relatives-window d9)
  )

  ;; Goal: visit all three cities, visit relatives in Valencia within the window,
  ;; and complete a total trip of 9 days (arrive at d10 after finishing day 9).
  (:goal
    (and
      (visited oslo)
      (visited dublin)
      (visited valencia)
      (relatives-visited)
      (day d10)
    )
  )
)