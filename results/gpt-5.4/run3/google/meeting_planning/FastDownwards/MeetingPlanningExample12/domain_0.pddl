(define (domain meet_barbara_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    place person time
  )

  (:predicates
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
    (at ?p - place)
    (connected ?from - place ?to - place)
    (available ?who - person ?p - place ?t - time)
    (first_segment_ready ?who - person)
    (met_required ?who - person)
  )

  (:action travel
    :parameters (?from - place ?to - place ?t1 - time ?t2 - time)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (at ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (not (at ?from))
      (at ?to)
      (not (first_segment_ready barbara))
    )
  )

  (:action wait
    :parameters (?p - place ?t1 - time ?t2 - time)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (at ?p)
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (not (first_segment_ready barbara))
    )
  )

  (:action meet_first_segment
    :parameters (?who - person ?p - place ?t1 - time ?t2 - time)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (at ?p)
      (available ?who ?p ?t1)
      (not (first_segment_ready ?who))
      (not (met_required ?who))
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (first_segment_ready ?who)
    )
  )

  (:action meet_second_segment
    :parameters (?who - person ?p - place ?t1 - time ?t2 - time)
    :precondition (and
      (current ?t1)
      (next ?t1 ?t2)
      (at ?p)
      (available ?who ?p ?t1)
      (first_segment_ready ?who)
      (not (met_required ?who))
    )
    :effect (and
      (not (current ?t1))
      (current ?t2)
      (not (first_segment_ready ?who))
      (met_required ?who)
    )
  )
)