(define (problem tripplanningexample1-problem)
  (:domain tripplanningexample1)
  (:objects
    riga manchester split - city
  )
  (:init
    (at riga)

    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)

    (= (days-remaining) 15)
    (= (need riga) 5)
    (= (need manchester) 4)
    (= (need split) 6)
  )
  (:goal
    (and
      (= (days-remaining) 0)
      (= (need riga) 0)
      (= (need manchester) 0)
      (= (need split) 0)
    )
  )
)