(define (problem itinerary-15)
  (:domain travel-itinerary)
  (:objects
    split manchester riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15)

    (direct riga manchester) (direct manchester riga)
    (direct manchester split)

    (at split d1)
    (assigned d1)

    (= (days-in split) 1)
    (= (days-in manchester) 0)
    (= (days-in riga) 0)
    (= (total-days) 1)
  )
  (:goal (and
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)
    (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15)

    (= (days-in split) 6)
    (= (days-in manchester) 4)
    (= (days-in riga) 7)
    (= (total-days) 15)
  ))
)