(define (problem san_francisco_meeting_instance)
  
  (:domain san_francisco_meeting)

  (:objects
    the_castro golden_gate_park - location
    you jeffrey - person
  )

  (:init
    (at you the_castro)
    (at jeffrey golden_gate_park)
    (visited the_castro)
    (not (meeting_started))
    (not (meeting_completed))
  )

  (:goal
    (and
      (meeting_completed)
      (visited golden_gate_park)
    )
  )
)