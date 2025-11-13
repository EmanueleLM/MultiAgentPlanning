(define (problem MeetingPlanningExample24-problem)
  (:domain MeetingPlanningExample24)
  (:objects
    nobhill presidio - location
    agent matthew - person
  )
  (:init
    (at agent nobhill)
    (connected nobhill presidio)
    (connected presidio nobhill)

    ; Timed availability window for Matthew (times in minutes from 09:00)
    (at 120 (available matthew))              ; 11:00
    (at 120 (at_time_available matthew))      ; mirror flag (not required by actions)
    (at 375 (not (available matthew)))        ; 15:15
    (at 375 (not (at_time_available matthew)))
  )
  (:goal (and
    (met matthew)
  ))
  (:metric minimize (total-time))
)