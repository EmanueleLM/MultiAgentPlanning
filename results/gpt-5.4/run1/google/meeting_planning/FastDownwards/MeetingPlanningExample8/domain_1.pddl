(define (domain san_francisco_meet_stephanie)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:constants
    chinatown marina_district - location
    stephanie - person
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (travel_12 ?from - location ?to - location)
    (next_12 ?t1 - timepoint ?t2 - timepoint)
    (next_105 ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?t - timepoint)
    (met_minimum ?p - person)
  )

  (:action travel_12_action
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (travel_12 ?from ?to)
      (next_12 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_stephanie_for_105
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at marina_district)
      (current_time ?t1)
      (available stephanie ?t1)
      (available stephanie ?t2)
      (next_105 ?t1 ?t2)
      (not (met_minimum stephanie))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_minimum stephanie)
    )
  )
)