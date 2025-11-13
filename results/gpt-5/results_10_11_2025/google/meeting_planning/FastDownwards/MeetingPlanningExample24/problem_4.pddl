(define (problem MeetingPlanningExample24-problem)
  (:domain MeetingPlanningExample24)
  (:objects
    nobhill presidio - location
    agent matthew - person
    t0900 t1043 t1100 t1130 t1148 t1515 - timepoint
  )
  (:init
    (at agent nobhill)
    (connected nobhill presidio)
    (connected presidio nobhill)
    (current t0900)

    (matthew_at presidio)

    (can_wait t0900 t1043)

    (travel nobhill presidio t1043 t1100)
    (travel presidio nobhill t1130 t1148)

    (meet_window t1100 t1130)
  )
  (:goal (and
    (met matthew)
  ))
)