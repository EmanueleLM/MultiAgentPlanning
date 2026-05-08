(define (problem meet-matthew-instance)
  (:domain meet-matthew)

  (:objects
    you matthew - person
    nobhill presidio - location
    t0900 t1043 t1100 t1130 t1515 - timepoint
  )

  (:init
    (at you nobhill t0900)
    ;; travel and waiting legs explicitly encode feasible transitions and travel times
    (travel_leg nobhill presidio t1043 t1100)
    (wait_leg nobhill t0900 t1043)
    ;; Matthew is available 11:00-15:15; we encode at least one allowed 30-minute meeting interval
    (allowed_meeting t1100 t1130)
  )

  (:goal (and
    (met_matt)
  ))
)