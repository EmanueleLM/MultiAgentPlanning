(define (problem meet-mary-problem)
  (:domain meet-mary)
  (:objects
    union_square nob_hill - location
    mary - person
  )
  (:init
    (at union_square)
    (friend-location mary nob_hill)
    (= (current-time) 540)
    (= (total-cost) 0)
    (= (travel-time union_square nob_hill) 9)
    (= (travel-time nob_hill union_square) 7)
    (= (avail-start mary) 720)
    (= (latest-start mary) 900)
    (= (avail-end mary) 975)
  )
  (:goal (met mary))
  (:metric minimize (total-cost))
)