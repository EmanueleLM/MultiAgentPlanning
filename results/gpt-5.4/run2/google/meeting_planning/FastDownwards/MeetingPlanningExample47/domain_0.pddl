(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler person location time
  )

  (:predicates
    (at ?x - traveler ?l - location)
    (current_time ?t - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (next_time ?t1 - time ?t2 - time)
    (available ?p - person ?l - location ?start - time ?end - time)
    (meeting_started ?p - person)
    (minimum_meeting_step ?p - person ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  (:action travel
    :parameters (?x - traveler ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?x ?from)
      (current_time ?t1)
      (travel_edge ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?x ?from))
      (at ?x ?to)
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

  (:action start_meeting
    :parameters (?x - traveler ?p - person ?l - location ?t_start - time ?t_end - time)
    :precondition (and
      (at ?x ?l)
      (current_time ?t_start)
      (available ?p ?l ?t_start ?t_end)
      (not (meeting_started ?p))
      (not (met ?p))
    )
    :effect (and
      (meeting_started ?p)
    )
  )

  (:action finish_meeting_minimum
    :parameters (?p - person ?t1 - time ?t2 - time)
    :precondition (and
      (meeting_started ?p)
      (current_time ?t1)
      (minimum_meeting_step ?p ?t1 ?t2)
    )
    :effect (and
      (not (meeting_started ?p))
      (met ?p)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )
)