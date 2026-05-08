(define (domain san_francisco_joseph_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (connected ?from - location ?to - location)
    (travel_step ?from - location ?to - location ?t1 - time ?t2 - time)
    (wait_step ?l - location ?t1 - time ?t2 - time)
    (available ?p - person ?l - location ?start - time ?end - time)
    (meeting_step ?p - person ?l - location ?t1 - time ?t2 - time)
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_step ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action wait
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (wait_step ?l ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_minimum_duration
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (not (met ?p))
      (available ?p ?l t_1130 t_1515)
      (meeting_step ?p ?l ?t1 ?t2)
    )
    :effect (and
      (met ?p)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)