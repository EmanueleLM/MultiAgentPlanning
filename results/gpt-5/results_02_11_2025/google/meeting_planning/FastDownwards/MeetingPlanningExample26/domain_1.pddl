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

  (:action travel_richmond_to_presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (at richmond_district)
      (current ?t)
      (plus7 ?t ?t2)
    )
    :effect (and
      (not (at richmond_district))
      (at presidio)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action meet_one_minute_notyet105
    :parameters (?t - time ?t2 - time ?c - count ?c2 - count)
    :precondition (and
      (at presidio)
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
    :parameters (?t - time ?t2 - time ?c - count ?c2 - count)
    :precondition (and
      (at presidio)
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