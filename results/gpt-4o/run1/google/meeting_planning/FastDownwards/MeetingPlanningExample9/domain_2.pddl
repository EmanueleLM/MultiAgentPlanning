(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location friend time stage)

  (:predicates
    (at_location ?loc - location ?time - time)
    (friend_available ?friend - friend ?loc - location ?time - time)
    (stage_at ?stage - stage)
    (goal_met ?goal - goal)
  )

  (:constants
    union_square nob_hill - location
    mary - friend
    9am 12pm 4_15pm - time
    schedule_stage_1 schedule_stage_2 schedule_stage_3 schedule_stage_4 - stage
    visit_mary - goal
  )

  (:action travel_from_union_square_to_nob_hill
    :parameters (?start - time ?end - time)
    :precondition (and 
      (at_location union_square ?start)
      (stage_at schedule_stage_1)
    )
    :effect (and
      (not (at_location union_square ?start))
      (at_location nob_hill ?end)
      (not (stage_at schedule_stage_1))
      (stage_at schedule_stage_2)
    )
  )

  (:action travel_from_nob_hill_to_union_square
    :parameters (?start - time ?end - time)
    :precondition (and
      (at_location nob_hill ?start)
      (stage_at schedule_stage_3)
    )
    :effect (and
      (not (at_location nob_hill ?start))
      (at_location union_square ?end)
      (not (stage_at schedule_stage_3))
      (stage_at schedule_stage_4)
    )
  )

  (:action meet_mary
    :parameters (?start - time ?end - time)
    :precondition (and
      (at_location nob_hill ?start)
      (friend_available mary nob_hill ?start)
      (stage_at schedule_stage_2)
    )
    :effect (and
      (not (stage_at schedule_stage_2))
      (stage_at schedule_stage_3)
      (goal_met visit_mary)
    )
  )
)