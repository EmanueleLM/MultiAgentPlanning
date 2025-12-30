(define (problem meeting-planning-14)
  (:domain meeting-schedule)
  (:objects
    nob-hill marina-district - location
    T0 T11 T660 T780 T792 - time-state
  )
  (:init
    (= (friends-met) 0)
    (= (total-cost) 0)
    (at nob-hill)
    (time-state-is T0)
  )
  (:goal
    (and
        (time-state-is T780) ; Ensure meeting is complete
        (mary-met) ; Ensure Mary was met
    )
  )
  (:metric minimize (total-cost))
)