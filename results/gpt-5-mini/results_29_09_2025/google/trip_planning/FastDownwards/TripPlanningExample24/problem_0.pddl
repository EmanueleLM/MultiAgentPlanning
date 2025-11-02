(define (problem trip13)
  (:domain europe-trip)
  (:objects
    florence amsterdam riga - city
  )
  (:init
    ;; initial location and day accounting:
    (at florence)
    (= (day) 1)
    (= (spent-florence) 1)    ; day 1 counted as Florence day
    (= (spent-amsterdam) 0)
    (= (spent-riga) 0)

    ;; connectivity: only direct flights allowed (and self-stays)
    (connected florence florence)
    (connected amsterdam amsterdam)
    (connected riga riga)

    (connected florence amsterdam)
    (connected amsterdam florence)

    (connected amsterdam riga)
    (connected riga amsterdam)

    ;; No direct connection between florence and riga is encoded by absence of connected florence riga / riga florence
  )

  (:goal
    (and
      (= (day) 13)
      (= (spent-florence) 4)
      (= (spent-amsterdam) 5)
      (= (spent-riga) 4)
    )
  )
)