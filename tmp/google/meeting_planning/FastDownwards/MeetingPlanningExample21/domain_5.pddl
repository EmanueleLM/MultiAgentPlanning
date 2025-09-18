(define (domain combined-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person time)

  (:predicates
    (at ?a - agent ?l - location)
    (visitor-at ?l - location)
    (met ?p - person)
    (current-time ?t - time)
    (plus11 ?t1 ?t2 - time)
    (plus12 ?t1 ?t2 - time)
    (plus30 ?t1 ?t2 - time)
    (within-availability ?t1 ?t2 - time)
  )

  (:action travel-md-to-ha
    :parameters (?a - agent ?ts ?te - time)
    :precondition (and
      (at ?a mission-district)
      (current-time ?ts)
      (plus12 ?ts ?te)
    )
    :effect (and
      (not (at ?a mission-district))
      (at ?a haight-ashbury)
      (not (current-time ?ts))
      (current-time ?te)
    )
  )

  (:action travel-ha-to-md
    :parameters (?a - agent ?ts ?te - time)
    :precondition (and
      (at ?a haight-ashbury)
      (current-time ?ts)
      (plus11 ?ts ?te)
    )
    :effect (and
      (not (at ?a haight-ashbury))
      (at ?a mission-district)
      (not (current-time ?ts))
      (current-time ?te)
    )
  )

  (:action meet-margaret
    :parameters (?a - agent ?ts ?te - time)
    :precondition (and
      (at ?a haight-ashbury)
      (visitor-at haight-ashbury)
      (current-time ?ts)
      (plus30 ?ts ?te)
      (within-availability ?ts ?te)
      (not (met margaret))
    )
    :effect (and
      (met margaret)
      (not (current-time ?ts))
      (current-time ?te)
    )
  )
)