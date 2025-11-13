(define (domain visit_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location time count
  )
  (:predicates
    (at ?l - location)
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
    (plus7 ?t1 - time ?t2 - time)
    (avail_sarah ?t - time)
    (met_count ?c - count)
    (nextcount ?c1 - count ?c2 - count)
    (threshold ?c - count)
    (done105)
    (jump_allowed ?from - time ?to - time)
    (conn7 ?from - location ?to - location)
    (meetloc_sarah ?l - location)
  )

  (:action jump
    :parameters (?from - time ?to - time)
    :precondition (and
      (current ?from)
      (jump_allowed ?from ?to)
    )
    :effect (and
      (not (current ?from))
      (current ?to)
    )
  )

  (:action travel_7min
    :parameters (?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and
      (at ?from)
      (current ?t)
      (conn7 ?from ?to)
      (plus7 ?t ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action meet_one_minute_notyet105
    :parameters (?l - location ?t - time ?t2 - time ?c - count ?c2 - count)
    :precondition (and
      (at ?l)
      (meetloc_sarah ?l)
      (current ?t)
      (next ?t ?t2)
      (avail_sarah ?t)
      (met_count ?c)
      (nextcount ?c ?c2)
      (not (threshold ?c2))
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (not (met_count ?c))
      (met_count ?c2)
    )
  )

  (:action meet_one_minute_threshold_or_beyond
    :parameters (?l - location ?t - time ?t2 - time ?c - count ?c2 - count)
    :precondition (and
      (at ?l)
      (meetloc_sarah ?l)
      (current ?t)
      (next ?t ?t2)
      (avail_sarah ?t)
      (met_count ?c)
      (nextcount ?c ?c2)
      (threshold ?c2)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (not (met_count ?c))
      (met_count ?c2)
      (done105)
    )
  )
)