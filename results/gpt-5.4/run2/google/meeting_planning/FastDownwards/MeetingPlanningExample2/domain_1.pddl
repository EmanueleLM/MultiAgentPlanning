(define (domain meet_jessica_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (connected ?from - location ?to - location)
    (travel_15 ?from - location ?to - location)
    (available ?p - person ?t - timepoint)
    (can_complete_90_from ?t_start - timepoint ?t_end - timepoint)
    (met ?p - person)
  )

  (:action wait
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?t1)
      (connected ?from ?to)
      (travel_15 ?from ?to)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_jessica_for_90
    :parameters (?t_start - timepoint ?t_end - timepoint ?p - person ?l - location)
    :precondition (and
      (at ?l)
      (current_time ?t_start)
      (available ?p ?t_start)
      (can_complete_90_from ?t_start ?t_end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met ?p)
    )
  )
)