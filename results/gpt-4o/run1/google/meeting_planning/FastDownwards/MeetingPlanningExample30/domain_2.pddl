(define (domain san_francisco_visit)
  (:requirements :strips :typing)

  (:types
    location person stage
  )

  (:predicates
    (at ?person - person ?location - location)
    (can_meet ?person1 - person ?person2 - person)
    (visited ?person - person ?location - location)
    (stage_reached ?stage - stage)
    (met_stephanie)
  )

  (:constants
    richmond_district north_beach - location
    you stephanie - person
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:action travel_to_north_beach
    :parameters (?current_stage - stage ?next_stage - stage)
    :precondition (and
      (at you richmond_district)
      (stage_reached ?current_stage)
      (not (stage_reached stage_3))  ;; ensure this is done early
    )
    :effect (and
      (at you north_beach)
      (stage_reached ?next_stage)
      (visited you north_beach)
    )
  )

  (:action meet_stephanie
    :parameters (?current_stage - stage ?next_stage - stage)
    :precondition (and
      (at you north_beach)
      (stage_reached ?current_stage)
      (not (met_stephanie))
    )
    :effect (and
      (can_meet you stephanie)
      (stage_reached ?next_stage)
      (met_stephanie)
    )
  )

  (:action travel_to_richmond
    :parameters (?current_stage - stage ?next_stage - stage)
    :precondition (and
      (at you north_beach)
      (met_stephanie)
      (stage_reached ?current_stage)
    )
    :effect (and
      (at you richmond_district)
      (stage_reached ?next_stage)
      (visited you richmond_district)
    )
  )
)