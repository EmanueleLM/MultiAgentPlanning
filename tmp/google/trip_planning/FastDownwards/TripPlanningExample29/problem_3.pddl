(define (problem integrated-trip-fd)
  (:domain integrated_trip_fd)

  (:objects
    frankfurt krakow dubrovnik - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    k0 k1 k2 - kcount
  )

  (:init
    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct dubrovnik frankfurt)
    (direct frankfurt dubrovnik)

    (wedding-in krakow)

    (unstarted)

    (day d0)
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

    (krakow-count k0)
    (next-k k0 k1)
    (next-k k1 k2)
  )

  (:goal (and
    (visited frankfurt)
    (visited krakow)
    (visited dubrovnik)
    (day d10)
    (krakow-count k2)
    (wedding-held)
  ))
)