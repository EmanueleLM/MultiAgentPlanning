(define (domain meetup)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?loc - location ?t - time)
    (can_travel_md_haight ?t1 - time ?t2 - time)
    (can_travel_haight_md ?t1 - time ?t2 - time)
    (can_meet_sam ?t1 - time ?t2 - time)
    (can_meet_margaret ?t1 - time ?t2 - time)
    (met_sam)
    (met_margaret)
  )

  (:action travel_mission_to_haight
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a mission_district ?t1)
      (can_travel_md_haight ?t1 ?t2)
    )
    :effect (and
      (not (at ?a mission_district ?t1))
      (at ?a haight_ashbury ?t2)
    )
  )

  (:action travel_haight_to_mission
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a haight_ashbury ?t1)
      (can_travel_haight_md ?t1 ?t2)
    )
    :effect (and
      (not (at ?a haight_ashbury ?t1))
      (at ?a mission_district ?t2)
    )
  )

  (:action meet_sam
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a mission_district ?t1)
      (can_meet_sam ?t1 ?t2)
      (not (met_sam))
    )
    :effect (and
      (not (at ?a mission_district ?t1))
      (at ?a mission_district ?t2)
      (met_sam)
    )
  )

  (:action meet_margaret
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a haight_ashbury ?t1)
      (can_meet_margaret ?t1 ?t2)
      (not (met_margaret))
    )
    :effect (and
      (not (at ?a haight_ashbury ?t1))
      (at ?a haight_ashbury ?t2)
      (met_margaret)
    )
  )
)