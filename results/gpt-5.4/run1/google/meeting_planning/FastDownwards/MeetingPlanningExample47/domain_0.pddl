(define (domain meet_friend_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    person
    location
    time
  )

  (:predicates
    (at ?tr - traveler ?loc - location)
    (current_time ?t - time)
    (met ?p - person)

    (next_time ?t1 - time ?t2 - time)
    (travel_arrives ?from - location ?to - location ?depart - time ?arrive - time)
    (available_start ?p - person ?t - time)
    (meeting_end ?p - person ?start - time ?end - time)
    (person_at ?p - person ?loc - location)
  )

  (:action wait_to_next
    :parameters (?from_t - time ?to_t - time)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?tr - traveler ?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?tr ?from)
      (current_time ?depart)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_minimum_duration
    :parameters (?tr - traveler ?p - person ?loc - location ?start - time ?end - time)
    :precondition (and
      (at ?tr ?loc)
      (person_at ?p ?loc)
      (current_time ?start)
      (available_start ?p ?start)
      (meeting_end ?p ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)