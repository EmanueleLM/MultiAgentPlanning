(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types location friend stage)

  (:predicates
    (at ?loc - location)
    (friend_available ?friend - friend ?loc - location)
    (stage_at ?stage - stage)
    (visited_mary)
  )

  (:action travel_to_nob_hill
    :parameters ()
    :precondition (and 
      (at union_square)
      (stage_at stage_before_noon)
    )
    :effect (and
      (not (at union_square))
      (at nob_hill)
      (not (stage_at stage_before_noon))
      (stage_at schedule_stage_mary_visit)
    )
  )

  (:action meet_mary
    :parameters ()
    :precondition (and
      (at nob_hill)
      (friend_available mary nob_hill)
      (stage_at schedule_stage_mary_visit)
    )
    :effect (and
      (not (stage_at schedule_stage_mary_visit))
      (stage_at stage_after_mary_visit)
      (visited_mary)
    )
  )

  (:action travel_to_union_square
    :parameters ()
    :precondition (and
      (at nob_hill)
      (stage_at stage_after_mary_visit)
    )
    :effect (and
      (not (at nob_hill))
      (at union_square)
      (not (stage_at stage_after_mary_visit))
      (stage_at stage_end)
    )
  )
)