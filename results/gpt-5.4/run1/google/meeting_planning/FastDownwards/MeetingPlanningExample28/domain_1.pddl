(define (domain san_francisco_joshua_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:constants
    union_square chinatown - location
    joshua - person
    t_9_00am t_6_00pm t_7_15pm t_9_30pm - time
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location)
    (available ?p - person ?start - time ?end - time)
    (met ?p - person)
  )

  (:action move
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
      (not (current_time ?t2))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_joshua_75
    :parameters ()
    :precondition (and
      (at chinatown)
      (person_at joshua chinatown)
      (current_time t_6_00pm)
      (available joshua t_6_00pm t_9_30pm)
      (not (met joshua))
    )
    :effect (and
      (not (current_time t_6_00pm))
      (current_time t_7_15pm)
      (met joshua)
    )
  )
)