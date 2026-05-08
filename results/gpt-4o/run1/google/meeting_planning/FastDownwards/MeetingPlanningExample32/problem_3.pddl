(define (problem san_francisco_meeting_instance)
  
  (:domain san_francisco_meeting)

  (:objects
    the_castro golden_gate_park - location
    traveler jeffrey - person
  )

  (:init
    (at traveler the_castro)
    (at jeffrey golden_gate_park)
    (visited the_castro)
    (not (meeting_in_progress))
    (not (meeting_completed))
  )

  (:goal
    (and
      (meeting_completed)
      (visited golden_gate_park)
    )
  )
)