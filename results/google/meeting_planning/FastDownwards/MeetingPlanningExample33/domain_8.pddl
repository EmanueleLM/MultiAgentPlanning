(define (domain multiagent-meetings)
  (:requirements :strips :typing :equality :negative-preconditions :adl :action-costs)
  (:types agent location time)
  (:constants traveler friend_sarah orchestrator - agent
              sunset-district union-square - location)
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - time)
    (time-next15 ?t1 - time ?t2 - time)
    (time-next30 ?t1 - time ?t2 - time)
    (time-next26 ?t1 - time ?t2 - time)
    (sarah-allowed ?t1 - time ?t2 - time)
    (sarah-met)
  )

  (:action travel-sd-to-us-by-traveler
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler sunset-district)
      (at-time ?t1)
      (time-next30 ?t1 ?t2)
    )
    :effect (and
      (not (at traveler sunset-district))
      (at traveler union-square)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 30
  )

  (:action travel-us-to-sd-by-traveler
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler union-square)
      (at-time ?t1)
      (time-next26 ?t1 ?t2)
    )
    :effect (and
      (not (at traveler union-square))
      (at traveler sunset-district)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 26
  )

  (:action meet-friend-at-sd-by-traveler
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler sunset-district)
      (at-time ?t1)
      (time-next15 ?t1 ?t2)
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost -985
  )

  (:action meet-sarah-at-us-by-traveler
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at traveler union-square)
      (at-time ?t1)
      (time-next15 ?t1 ?t2)
      (sarah-allowed ?t1 ?t2)
      (not (sarah-met))
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
      (sarah-met)
    )
    :cost -985
  )
)