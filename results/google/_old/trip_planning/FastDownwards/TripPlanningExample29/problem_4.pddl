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

    (current-day d0)
    (next-day d0 d1)
    (next-day d1 d2)
    (next-day d2 d3)
    (next-day d3 d4)
    (next-day d4 d5)
    (next-day d5 d6)
    (next-day d6 d7)
    (next-day d7 d8)
    (next-day d8 d9)
    (next-day d9 d10)

    (krakow-count k0)
    (next-kcount k0 k1)
    (next-kcount k1 k2)
  )

  (:goal (and
    (visited frankfurt)
    (visited krakow)
    (visited dubrovnik)
    (current-day d10)
    (krakow-count k2)
    (wedding-held)
  ))
)