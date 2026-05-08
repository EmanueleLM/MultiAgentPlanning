(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (next ?t1 - timepoint ?t2 - timepoint)
    (route ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (available_for_meeting ?p - person ?l - location ?start - timepoint ?end - timepoint)
    (met ?p - person)
  )

  (:action wait_to_next
    :parameters (?t1 - timepoint ?t2 - timepoint ?l - location)
    :precondition (and
      (current_time ?t1)
      (next ?t1 ?t2)
      (at ?l)
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
      (route ?from ?to)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_min_45
    :parameters (?p - person ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (available_for_meeting ?p ?l ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)