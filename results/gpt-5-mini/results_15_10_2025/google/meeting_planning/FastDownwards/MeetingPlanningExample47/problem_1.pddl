(define (problem schedule-problem)
  (:domain schedule-meetings)
  (:objects
    traveler paul - person
    richmond-district nob-hill - location
    t0 t17 t30 t45 t135 - time
    dur17 dur13 dur15 - duration
  )
  (:init
    (at traveler richmond-district)
    (at-time t0)
    (time-add t0 dur17 t17)
    (time-add t17 dur13 t30)
    (time-add t30 dur15 t45)
    (within-paul-availability t30 t45)
  )
  (:goal (and (at-time t45)))
  (:metric minimize (total-cost))
)