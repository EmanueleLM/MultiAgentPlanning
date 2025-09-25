(define (problem trip12)
  (:domain travel-integrated)
  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )
  (:init
    (at dubrovnik)
    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)
    (day-free d1) (day-free d2) (day-free d3) (day-free d4) (day-free d5)
    (day-free d6) (day-free d7) (day-free d8) (day-free d9) (day-free d10)
    (day-free d11) (day-free d12)
  )
  (:goal (and
    (assigned d1 istanbul) (assigned d2 istanbul) (assigned d3 istanbul) (assigned d4 istanbul) (assigned d5 istanbul)
    (assigned d6 dubrovnik) (assigned d7 dubrovnik) (assigned d8 dubrovnik)
    (assigned d9 budapest) (assigned d10 budapest) (assigned d11 budapest) (assigned d12 budapest)
  ))
)