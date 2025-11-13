(define (problem meetingplanningexample22-problem)
  (:domain meetingplanningexample22)
  (:objects
    presidio union_square - location
    t540 t600 t630 t645 t653 t675 t780 - time
  )
  (:init
    (at presidio)
    (cur t540)

    (succ_60 t540 t600)
    (succ_30 t600 t630)
    (succ_15 t630 t645)
    (succ_8 t645 t653)
    (succ_22 t653 t675)

    (meet_start_ok t675)
    (succ_105 t675 t780)

    (= (total-cost) 0)
  )
  (:goal (met_andrew))
  (:metric minimize (total-cost))
)