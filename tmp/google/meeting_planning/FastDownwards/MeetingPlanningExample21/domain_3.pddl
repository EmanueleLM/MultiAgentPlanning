(define (domain combined-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location person time)
  (:constants agent1 agent2 - agent missiondistrict haightashbury - location margaret - person)

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

  (:action travel-agent1-md-to-ha
    :parameters (?ts ?te - time)
    :precondition (and
      (at agent1 missiondistrict)
      (current_time ?ts)
      (plus12 ?ts ?te)
    )
    :effect (and
      (not (at agent1 missiondistrict))
      (at agent1 haightashbury)
      (not (current_time ?ts))
      (current_time ?te)
    )
  )

  (:action travel-agent1-ha-to-md
    :parameters (?ts ?te - time)
    :precondition (and
      (at agent1 haightashbury)
      (current_time ?ts)
      (plus11 ?ts ?te)
    )
    :effect (and
      (not (at agent1 haightashbury))
      (at agent1 missiondistrict)
      (not (current_time ?ts))
      (current_time ?te)
    )
  )

  (:action meet-agent1-margaret
    :parameters (?ts ?te - time)
    :precondition (and
      (at agent1 haightashbury)
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

  (:action travel-agent2-md-to-ha
    :parameters (?ts ?te - time)
    :precondition (and
      (at agent2 missiondistrict)
      (current_time ?ts)
      (plus12 ?ts ?te)
    )
    :effect (and
      (not (at agent2 missiondistrict))
      (at agent2 haightashbury)
      (not (current_time ?ts))
      (current_time ?te)
    )
  )

  (:action travel-agent2-ha-to-md
    :parameters (?ts ?te - time)
    :precondition (and
      (at agent2 haightashbury)
      (current_time ?ts)
      (plus11 ?ts ?te)
    )
    :effect (and
      (not (at agent2 haightashbury))
      (at agent2 missiondistrict)
      (not (current_time ?ts))
      (current_time ?te)
    )
  )

  (:action meet-agent2-margaret
    :parameters (?ts ?te - time)
    :precondition (and
      (at agent2 haightashbury)
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