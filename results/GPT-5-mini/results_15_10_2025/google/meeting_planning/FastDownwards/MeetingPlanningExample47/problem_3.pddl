(define (problem schedule-problem)
  (:domain schedule-meetings)
  (:objects
    traveler paul - person
    richmond-district nob-hill - location
    t0 t17 t30 t45 - time
    dur17 dur13 dur15 - duration
  )
  (:init
    (at traveler richmond-district)
    (at paul nob-hill)
    (time-point t0)
    (time-add t0 dur17 t17)
    (time-add t17 dur13 t30)
    (time-add t30 dur15 t45)
    (travel-duration richmond-district nob-hill dur17)
    (travel-duration nob-hill richmond-district dur13)
    (available paul t30 t45)
    (= (total-cost) 0)
  )
  (:goal (and (met paul)))
  (:metric minimize (total-cost))
)