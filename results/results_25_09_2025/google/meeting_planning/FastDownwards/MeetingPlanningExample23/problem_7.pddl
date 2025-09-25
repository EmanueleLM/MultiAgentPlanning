(define (problem meet-john-problem-classical)
  (:domain meeting-schedule-classical)
  (:objects
    traveler john orchestrator - agent
    bayview russianhill - location
    t09_00 t09_23 t17_30 t19_45 t21_00 - timepoint
  )
  (:init
    (at traveler bayview)
    (at john russianhill)
    (at-time traveler t09_00)
    (time-travel t09_00 t09_23)
    (time-advances t09_23 t17_30)
    (time-advances t17_30 t19_45)
    (time-advances t19_45 t21_00)
    (john-available t17_30 t19_45)
    (john-available t17_30 t21_00)
    (john-available t19_45 t21_00)
    (long-enough t17_30 t19_45)
    (long-enough t17_30 t21_00)
    (long-enough t19_45 t21_00)
  )
  (:goal (met))
)