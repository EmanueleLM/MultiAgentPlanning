(define (problem MeetingPlanningExample24-problem)
  (:domain MeetingPlanningExample24)
  (:objects
    nobhill presidio - location
    agent matthew - person
    t0900 t1043 t1100 t1130 t1148 - timepoint
  )
  (:init
    (at agent nobhill)
    (connected nobhill presidio)
    (connected presidio nobhill)
    (current t0900)
    (= (total-cost) 0)
  )
  (:goal (and
    (met matthew)
  ))
  (:metric minimize (total-cost))
)