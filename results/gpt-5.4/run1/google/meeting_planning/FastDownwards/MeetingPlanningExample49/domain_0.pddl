(define (domain meet_friend_sf_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (next_time ?t1 - time ?t2 - time)
    (can_travel ?from - location ?to - location)
    (travel_arrive ?from - location ?depart - time ?to - location ?arrive - time)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - time)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
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
    :parameters (?from - location ?depart - time ?to - location ?arrive - time)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (can_travel ?from ?to)
      (travel_arrive ?from ?depart ?to ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_person
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and
      (at ?l)
      (current_time ?t)
      (person_at ?p ?l)
      (available_start ?p ?t)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
    )
  )
)