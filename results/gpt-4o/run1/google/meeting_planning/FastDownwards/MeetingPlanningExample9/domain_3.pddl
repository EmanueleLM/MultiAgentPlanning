(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types location friend time stage)

  (:predicates
    (at_location ?loc - location)
    (friend_available ?friend - friend ?loc - location)
    (stage_at ?stage - stage)
    (goal_met ?goal - goal)
  )

  (:action travel_from_union_square_to_nob_hill
    :parameters ()
    :precondition (and 
      (at_location union_square)
      (stage_at stage_before_noon)
    )
    :effect (and
      (not (at_location union_square))
      (at_location nob_hill)
      (not (stage_at stage_before_noon))
      (stage_at schedule_stage_mary_visit)
    )
  )

  (:action meet_mary
    :parameters ()
    :precondition (and
      (at_location nob_hill)
      (friend_available mary nob_hill)
      (stage_at schedule_stage_mary_visit)
    )
    :effect (and
      (not (stage_at schedule_stage_mary_visit))
      (stage_at stage_after_mary_visit)
      (goal_met visit_mary)
    )
  )

  (:action travel_from_nob_hill_to_union_square
    :parameters ()
    :precondition (and
      (at_location nob_hill)
      (stage_at stage_after_mary_visit)
    )
    :effect (and
      (not (at_location nob_hill))
      (at_location union_square)
      (not (stage_at stage_after_mary_visit))
      (stage_at stage_end)
    )
  )
)