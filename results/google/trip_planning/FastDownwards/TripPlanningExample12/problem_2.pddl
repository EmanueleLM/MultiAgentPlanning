(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5) (succ d5 d6)
    (succ d6 d7) (succ d7 d8) (succ d8 d9) (succ d9 d10) (succ d10 d11)
    (succ d11 d12) (succ d12 d13) (succ d13 d14) (succ d14 d15)

    (edge amsterdam tallinn)
    (edge tallinn amsterdam)
    (edge valencia amsterdam)
    (edge amsterdam valencia)

    (startday d1)
  )

  (:goal (and
    (at valencia d1) (at valencia d2) (at valencia d3) (at valencia d4) (at valencia d5)
    (at amsterdam d6) (at amsterdam d7) (at amsterdam d8)
    (at tallinn d9) (at tallinn d10) (at tallinn d11) (at tallinn d12) (at tallinn d13) (at tallinn d14) (at tallinn d15)
  ))
)