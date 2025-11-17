(define (problem trip15-instance)
  (:domain trip15)
  (:objects
    valencia amsterdam tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    (is-tallinn tallinn)

    (succ d1 d2)
    (succ d2 d3)
    (succ d3 d4)
    (succ d4 d5)
    (succ d5 d6)
    (succ d6 d7)
    (succ d7 d8)
    (succ d8 d9)
    (succ d9 d10)
    (succ d10 d11)
    (succ d11 d12)
    (succ d12 d13)
    (succ d13 d14)
    (succ d14 d15)

    (window d9)
    (window d10)
    (window d11)
    (window d12)
    (window d13)
    (window d14)
    (window d15)

    (direct amsterdam tallinn)
    (direct tallinn amsterdam)
    (direct valencia amsterdam)
    (direct amsterdam valencia)

    (at valencia d1)
    (current d1)
    (visited valencia)
    (assigned valencia d1)
  )
  (:goal
    (and
      (current d15)
      (visited valencia)
      (visited amsterdam)
      (visited tallinn)
      (met)
    )
  )
)