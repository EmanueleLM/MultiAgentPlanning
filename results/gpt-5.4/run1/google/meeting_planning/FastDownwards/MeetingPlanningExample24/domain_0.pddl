(define (domain meet_matthew_san_francisco)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (met_minimum ?p - person)

    (travel_slot ?from - location ?to - location ?start - timepoint ?end - timepoint)
    (wait_slot ?l - location ?start - timepoint ?end - timepoint)
    (available_start ?p - person ?l - location ?t - timepoint)
    (meeting_end ?p - person ?start - timepoint ?end - timepoint)
  )

  (:action move
    :parameters (?from - location ?to - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?start)
      (travel_slot ?from ?to ?start ?end)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?start))
      (current_time ?end)
    )
  )

  (:action wait
    :parameters (?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (wait_slot ?l ?start ?end)
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
    )
  )

  (:action meet_minimum
    :parameters (?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (available_start ?p ?l ?start)
      (meeting_end ?p ?start ?end)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_minimum ?p)
    )
  )
)