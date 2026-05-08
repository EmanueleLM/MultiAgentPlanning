(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
    interval
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (route ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (person_at ?p - person ?l - location)
    (available_interval ?p - person ?i - interval)
    (interval_start ?i - interval ?t - timepoint)
    (interval_end ?i - interval ?t - timepoint)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (route ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_person_for_interval
    :parameters (?p - person ?l - location ?i - interval ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?start)
      (available_interval ?p ?i)
      (interval_start ?i ?start)
      (interval_end ?i ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)