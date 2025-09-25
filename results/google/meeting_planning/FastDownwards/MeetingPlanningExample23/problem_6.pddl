(define (problem meet-john-problem-classical)
  (:domain meeting-schedule-classical)
  (:objects
    traveler john - agent
    bayview russianhill - location
    t09_00 t09_23 t17_30 t19_45 t21_00 - timepoint
  )
  (:init
    (at traveler bayview)
    (at john russianhill)
    (at-time traveler t09_00)
    (john_present t17_30)
    (john_present t19_45)
    (time-travel t09_00 t09_23)
    (time-advances t09_23 t17_30)
    (time-advances t17_30 t19_45)
    (= (total-cost) 0)
  )
  (:goal (met))
  (:metric minimize (total-cost))
)