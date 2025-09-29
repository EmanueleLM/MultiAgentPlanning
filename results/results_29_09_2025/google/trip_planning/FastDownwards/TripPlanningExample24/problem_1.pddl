(define (problem trip13)
  (:domain europe-trip)
  (:objects
    florence amsterdam riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    (= (total-cost) 0)

    (at florence d1)
    (assigned d1)
    (current d1)

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
    (next d12 d13)

    (connected florence florence)
    (connected amsterdam amsterdam)
    (connected riga riga)

    (connected florence amsterdam)
    (connected amsterdam florence)

    (connected amsterdam riga)
    (connected riga amsterdam)
  )

  (:goal
    (and
      (at florence d1)
      (at florence d2)
      (at florence d3)
      (at florence d4)

      (at amsterdam d5)
      (at amsterdam d6)
      (at amsterdam d7)
      (at amsterdam d8)
      (at amsterdam d9)

      (at riga d10)
      (at riga d11)
      (at riga d12)
      (at riga d13)

      (current d13)
    )
  )

  (:metric minimize (total-cost))
)