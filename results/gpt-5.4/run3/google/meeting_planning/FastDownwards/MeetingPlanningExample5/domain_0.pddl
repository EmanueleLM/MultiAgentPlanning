(define (domain meet_william_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (travel_time ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (person_at ?p - person ?l - location)
    (meeting_interval_75 ?p - person ?l - location ?start - timepoint ?end - timepoint)
    (met_75 ?p - person)
  )

  (:action wait
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_time ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_75_exact
    :parameters (?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?start)
      (meeting_interval_75 ?p ?l ?start ?end)
      (not (met_75 ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_75 ?p)
    )
  )
)