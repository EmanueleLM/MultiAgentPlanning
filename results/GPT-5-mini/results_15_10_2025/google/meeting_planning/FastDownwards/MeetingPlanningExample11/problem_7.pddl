(define (problem meet-carol-problem-classical)
  (:domain meet-visitors-classical)
  (:objects
    visitor carol - person
    nob_hill sunset_district - location
    t0 t25 t300 t375 t615 t690 - time
  )
  (:init
    (time-at t0)
    (at visitor nob_hill)
    (at carol sunset_district)

    (travel nob_hill sunset_district t0 t25)

    (wait_slot t0 t300)
    (wait_slot t25 t300)
    (wait_slot t25 t615)
    (wait_slot t300 t615)

    (meeting_slot t300 t375)
    (meeting_slot t615 t690)
  )
  (:goal (accounted carol))
  (:metric minimize (total-cost))
)