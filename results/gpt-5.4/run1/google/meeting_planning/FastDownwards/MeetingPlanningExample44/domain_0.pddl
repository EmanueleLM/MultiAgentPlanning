(define (domain san_francisco_meet_betty)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (connected ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (person_at ?p - person ?l - location)
    (meeting_window_105 ?p - person ?start - timepoint ?end - timepoint)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (connected ?from ?to ?depart ?arrive)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_min_105
    :parameters (?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (person_at ?p ?l)
      (meeting_window_105 ?p ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)