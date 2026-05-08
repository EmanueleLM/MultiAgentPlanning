(define (domain meeting_planning)
  (:requirements :strips :typing)
  (:types
    location
    person
    time
  )

  (:predicates
    (at_location ?l - location)
    (current_time ?t - time)
    (next_time ?t_from ?t_to - time)
    (is_travel ?from ?to - location ?t_start ?t_end - time)
    (can_meet ?p - person ?l - location ?t_start ?t_end - time)
    (met_person ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_location ?from)
      (current_time ?t1)
      (is_travel ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at_location ?from))
      (at_location ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at_location ?l)
      (current_time ?t1)
      (can_meet ?p ?l ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_person ?p)
    )
  )
)