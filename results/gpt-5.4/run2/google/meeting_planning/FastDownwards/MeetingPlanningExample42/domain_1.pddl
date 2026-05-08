(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    location
    person
    time
  )

  (:predicates
    (at ?a - traveler ?l - location)
    (friend_at ?p - person ?l - location)
    (available ?p - person ?from - time ?to - time)
    (time_now ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (person_present ?p - person ?t - time)
    (meeting ?a - traveler ?p - person)
    (met_minimum ?p - person)
    (minimum_completion ?p - person ?from - time ?to - time)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (time_now ?from)
      (next ?from ?to)
      (not (meeting ?a ?p))
    )
    :effect (and
      (not (time_now ?from))
      (time_now ?to)
    )
  )

  (:action travel
    :parameters (?a - traveler ?from_loc - location ?to_loc - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?a ?from_loc)
      (time_now ?depart)
      (travel_edge ?from_loc ?to_loc ?depart ?arrive)
      (not (meeting ?a ?p))
    )
    :effect (and
      (not (at ?a ?from_loc))
      (at ?a ?to_loc)
      (not (time_now ?depart))
      (time_now ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?a - traveler ?p - person ?l - location ?t - time)
    :precondition (and
      (time_now ?t)
      (at ?a ?l)
      (friend_at ?p ?l)
      (person_present ?p ?t)
      (available ?p ?start ?end)
      (not (meeting ?a ?p))
    )
    :effect (and
      (meeting ?a ?p)
    )
  )

  (:action continue_meeting
    :parameters (?a - traveler ?p - person ?from - time ?to - time ?l - location)
    :precondition (and
      (meeting ?a ?p)
      (time_now ?from)
      (next ?from ?to)
      (at ?a ?l)
      (friend_at ?p ?l)
      (person_present ?p ?from)
      (person_present ?p ?to)
    )
    :effect (and
      (not (time_now ?from))
      (time_now ?to)
    )
  )

  (:action complete_minimum_meeting
    :parameters (?a - traveler ?p - person ?from - time ?to - time ?l - location)
    :precondition (and
      (meeting ?a ?p)
      (time_now ?to)
      (at ?a ?l)
      (friend_at ?p ?l)
      (minimum_completion ?p ?from ?to)
      (person_present ?p ?from)
      (person_present ?p ?to)
      (not (met_minimum ?p))
    )
    :effect (and
      (met_minimum ?p)
    )
  )
)