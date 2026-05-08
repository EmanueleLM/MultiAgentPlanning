(define (domain san_francisco_meet_betty)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    location
    person
    time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (road ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_time ?from - location ?to - location ?depart - time ?arrive - time)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - time)
    (available_end ?p - person ?t - time)
    (meeting_slot ?p - person ?start - time ?end - time)
    (meeting_started ?p - person ?start - time)
    (met ?p - person)
  )

  (:action move
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?from)
      (current_time ?t1)
      (road ?from ?to)
      (travel_time ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
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
    :parameters (?a - agent ?p - person ?l - location ?ts - time ?te - time)
    :precondition (and
      (at ?a ?l)
      (person_at ?p ?l)
      (current_time ?ts)
      (available_start ?p ?ts)
      (meeting_slot ?p ?ts ?te)
      (not (met ?p))
      (not (meeting_started ?p ?ts))
    )
    :effect (and
      (meeting_started ?p ?ts)
    )
  )

  (:action finish_meeting
    :parameters (?a - agent ?p - person ?l - location ?ts - time ?te - time)
    :precondition (and
      (at ?a ?l)
      (person_at ?p ?l)
      (current_time ?te)
      (meeting_started ?p ?ts)
      (meeting_slot ?p ?ts ?te)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (meeting_started ?p ?ts))
    )
  )
)