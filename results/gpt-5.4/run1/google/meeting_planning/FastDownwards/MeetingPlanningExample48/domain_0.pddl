(define (domain san_francisco_joseph_visit)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (travel_link ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (joseph_available_segment ?l - location ?t1 - timepoint ?t2 - timepoint)
    (met_joseph)
  )

  (:action wait_to_next
    :parameters (?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (travel_link ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_joseph_for_15
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at union_square)
      (current_time ?t1)
      (joseph_available_segment union_square ?t1 ?t2)
      (not (met_joseph))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_joseph)
    )
  )
)