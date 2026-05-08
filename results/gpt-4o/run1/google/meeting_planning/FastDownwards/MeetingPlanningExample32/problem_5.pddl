(define (problem san_francisco_meeting_instance)

  (:domain san_francisco_meeting)

  (:objects
    the_castro golden_gate_park - location
    traveler jeffrey - person
  )

  (:init
    (at traveler the_castro)
    (at jeffrey golden_gate_park)
  )

  (:goal
    (and
      (visited golden_gate_park)
      (meeting_in_progress jeffrey)
    )
  )
)