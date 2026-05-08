(define (problem meeting-planning-14)
  (:domain meeting-schedule)
  (:objects
    nob-hill marina-district - location
    T0 T11 T660 T780 - time-state
  )
  (:init
    (= (total-time) 0)
    (= (friends-met) 0)
    (at nob-hill)
    (time-state-is T0)
  )
  (:goal
    (time-state-is T780)
  )
  (:metric maximize (friends-met))
)