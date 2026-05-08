(define (domain san_francisco_meet_james)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?p - person ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (connected ?from - location ?to - location)
    (travel_16 ?from - location ?to - location)
    (travel_18 ?from - location ?to - location)
    (next ?t1 - time ?t2 - time)
    (advance_16 ?t1 - time ?t2 - time)
    (advance_18 ?t1 - time ?t2 - time)
    (available_to_meet ?p - person ?t - time)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel_16_action
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from)
      (connected ?from ?to)
      (travel_16 ?from ?to)
      (current_time ?t1)
      (advance_16 ?t1 ?t2)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_18_action
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from)
      (connected ?from ?to)
      (travel_18 ?from ?to)
      (current_time ?t1)
      (advance_18 ?t1 ?t2)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_james
    :parameters (?self - person ?j - person ?t - time ?l - location)
    :precondition (and
      (at ?self ?l)
      (at ?j ?l)
      (current_time ?t)
      (available_to_meet ?j ?t)
      (not (met ?j))
    )
    :effect (and
      (met ?j)
    )
  )
)