(define (problem tripplanningexample19_problem)
  (:domain tripplanningexample19)

  (:objects
    brussels valencia nice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (at brussels)
    (current_day d1)

    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    (stay_need_nice d1)
    (stay_need_nice d2)
    (stay_need_nice d3)
    (stay_need_nice d4)
    (stay_need_nice d5)
    (stay_need_nice d6)
    (stay_need_valencia d7)
    (stay_need_valencia d8)
    (stay_need_brussels d9)

    (friends_window d1)
    (friends_window d2)
    (friends_window d3)
    (friends_window d4)
    (friends_window d5)
    (friends_window d6)
  )

  (:goal
    (and
      (met_friends)
      (not (current_day d1))
      (not (current_day d2))
      (not (current_day d3))
      (not (current_day d4))
      (not (current_day d5))
      (not (current_day d6))
      (not (current_day d7))
      (not (current_day d8))
      (not (current_day d9)))
  )
)