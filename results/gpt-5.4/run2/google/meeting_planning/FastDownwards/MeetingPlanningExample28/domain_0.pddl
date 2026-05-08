(define (domain san_francisco_meet_joshua)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (connected ?from - location ?to - location)
    (minute_next ?t1 - time ?t2 - time)
    (plus_7 ?t1 - time ?t2 - time)
    (plus_75 ?t1 - time ?t2 - time)
    (meeting_start_ok_joshua ?t - time)
    (met_minimum_joshua)
  )

  (:action wait_one_minute
    :parameters (?t1 - time ?t2 - time ?l - location)
    :precondition (and
      (current_time ?t1)
      (minute_next ?t1 ?t2)
      (at ?l)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (plus_7 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_joshua_minimum
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at chinatown)
      (current_time ?t1)
      (plus_75 ?t1 ?t2)
      (meeting_start_ok_joshua ?t1)
      (not (met_minimum_joshua))
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (met_minimum_joshua)
    )
  )
)