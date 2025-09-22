(define (domain combined-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person time)

  (:predicates
    (at ?a - agent ?l - location)
    (visitor-at ?l - location)
    (met ?p - person)
    (current_time ?t - time)
    (plus11 ?t1 ?t2 - time)
    (plus12 ?t1 ?t2 - time)
    (plus30 ?t1 ?t2 - time)
    (within-availability ?t1 ?t2 - time)
  )

  (:action travel-md-to-ha
    :parameters (?a - agent ?ts ?te - time)
    :precondition (and
      (at ?a missiondistrict)
      (current_time ?ts)
      (plus12 ?ts ?te)
    )
    :effect (and
      (not (at ?a missiondistrict))
      (at ?a haightashbury)
      (not (current_time ?ts))
      (current_time ?te)
    )
  )

  (:action travel-ha-to-md
    :parameters (?a - agent ?ts ?te - time)
    :precondition (and
      (at ?a haightashbury)
      (current_time ?ts)
      (plus11 ?ts ?te)
    )
    :effect (and
      (not (at ?a haightashbury))
      (at ?a missiondistrict)
      (not (current_time ?ts))
      (current_time ?te)
    )
  )

  (:action meet-margaret
    :parameters (?a - agent ?ts ?te - time)
    :precondition (and
      (at ?a haightashbury)
      (visitor-at haightashbury)
      (current_time ?ts)
      (plus30 ?ts ?te)
      (within-availability ?ts ?te)
      (not (met margaret))
    )
    :effect (and
      (met margaret)
      (not (current_time ?ts))
      (current_time ?te)
    )
  )
)