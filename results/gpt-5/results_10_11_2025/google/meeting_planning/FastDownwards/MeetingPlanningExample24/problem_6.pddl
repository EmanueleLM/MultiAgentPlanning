(define (problem MeetingPlanningExample24-problem)
  (:domain MeetingPlanningExample24)
  (:objects
    nobhill presidio - location
    agent - person
    t0900 t1043 t1100 t1130 - timepoint
  )
  (:init
    (at agent nobhill)
    (connected nobhill presidio)
    (connected presidio nobhill)
    (current t0900)

    (matthew_at presidio)

    (can_wait t0900 t1043)
    (travel nobhill presidio t1043 t1100)
    (meet_window t1100 t1130)
  )
  (:goal (and
    (met matthew)
  ))
)