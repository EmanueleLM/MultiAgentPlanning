(define (domain meetup)
  (:requirements :typing :negative-preconditions :fluents)
  (:types agent friend location time)

  (:predicates
    (at ?a - agent ?loc - location ?t - time)
    (can_travel_md_haight ?t1 - time ?t2 - time)
    (can_travel_haight_md ?t1 - time ?t2 - time)
    (can_meet_sam ?t1 - time ?t2 - time)
    (can_meet_margaret ?t1 - time ?t2 - time)
    (met ?f - friend)
    (finished)
  )

  (:functions (total_met))

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
    :parameters (?a - agent ?s - friend ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a mission_district ?t1)
      (can_meet_sam ?t1 ?t2)
      (not (met ?s))
    )
    :effect (and
      (not (at ?a mission_district ?t1))
      (at ?a mission_district ?t2)
      (met ?s)
      (increase (total_met) 1)
    )
  )

  (:action meet_margaret
    :parameters (?a - agent ?m - friend ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a haight_ashbury ?t1)
      (can_meet_margaret ?t1 ?t2)
      (not (met ?m))
    )
    :effect (and
      (not (at ?a haight_ashbury ?t1))
      (at ?a haight_ashbury ?t2)
      (met ?m)
      (increase (total_met) 1)
    )
  )

  (:action finish_day
    :parameters (?a - agent ?loc - location ?t - time)
    :precondition (and
      (at ?a ?loc ?t)
    )
    :effect (and
      (finished)
    )
  )
)