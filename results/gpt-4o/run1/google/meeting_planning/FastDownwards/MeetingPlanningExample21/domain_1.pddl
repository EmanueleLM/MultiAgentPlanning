(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates
    (at_location ?loc - location)
    (next_time ?t1 ?t2 - time)
    (meeting_possible ?pers - person)
    (visited ?pers - person)
  )

  (:action move_mission_to_haight
    :parameters (?start_time - time ?end_time - time)
    :precondition (and
      (at_location mission_district)
      (next_time ?start_time ?end_time)
    )
    :effect (and
      (not (at_location mission_district))
      (at_location haight_ashbury)
    )
  )

  (:action move_haight_to_mission
    :parameters (?start_time - time ?end_time - time)
    :precondition (and
      (at_location haight_ashbury)
      (next_time ?start_time ?end_time)
    )
    :effect (and
      (not (at_location haight_ashbury))
      (at_location mission_district)
    )
  )

  (:action meet_margaret
    :parameters (?start_time - time ?end_time - time)
    :precondition (and
      (meeting_possible margaret)
      (at_location haight_ashbury)
      (next_time ?start_time t9_12am)
      (next_time t9_12am t9_42am)
    )
    :effect (visited margaret)
  )
)