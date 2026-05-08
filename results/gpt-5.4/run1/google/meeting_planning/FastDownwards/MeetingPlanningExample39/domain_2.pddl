(define (domain meet_stephanie_san_francisco)
  (:requirements :strips :typing)

  (:types
    location
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (travel_edge ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (stephanie_available ?t - timepoint)
    (met_stephanie_minimum)
  )

  (:action wait
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_edge ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_stephanie_for_minimum
    :parameters (?start - timepoint ?end - timepoint)
    :precondition (and
      (at nob_hill)
      (current_time ?start)
      (stephanie_available ?start)
      (stephanie_available ?end)
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_stephanie_minimum)
    )
  )
)