(define (problem tripplanningexample20-problem)
  (:domain tripplanningexample20)
  (:objects
    istanbul budapest dubrovnik - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )
  (:init
    ; start location and phase (visit order)
    (at dubrovnik)
    (phase dubrovnik)

    ; allowed direct flights
    (edge istanbul budapest)
    (edge budapest istanbul)
    (edge dubrovnik istanbul)

    ; enforced visit order (auditor's recommendation)
    (order-next dubrovnik istanbul)
    (order-next istanbul budapest)

    ; global day counter (must reach exactly d12 via stays)
    (currday d0)
    (next d0 d1)
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
    (next d11 d12)

    ; decrement relation for per-city stay quotas
    (dec d12 d11)
    (dec d11 d10)
    (dec d10 d9)
    (dec d9 d8)
    (dec d8 d7)
    (dec d7 d6)
    (dec d6 d5)
    (dec d5 d4)
    (dec d4 d3)
    (dec d3 d2)
    (dec d2 d1)
    (dec d1 d0)

    ; selected 12-day allocation (remaining days per city)
    (rem istanbul d4)
    (rem budapest d6)
    (rem dubrovnik d2)
  )
  (:goal (and
    (currday d12)
    (rem istanbul d0)
    (rem budapest d0)
    (rem dubrovnik d0)
  ))
)