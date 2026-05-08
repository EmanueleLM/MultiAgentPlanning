(define (domain san_francisco_meeting_matthew)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler person location time
  )

  (:predicates
    (at ?tr - traveler ?loc - location)
    (person_at ?p - person ?loc - location)
    (current_time ?t - time)

    (connected ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?depart - time ?arrive - time)
    (next_time ?t1 - time ?t2 - time)

    (available_at ?p - person ?t - time)

    (meeting_started ?p - person)
    (meeting_began_at ?p - person ?t - time)
    (meeting_30_from_to ?p - person ?start - time ?end - time)
    (met ?p - person)
  )

  (:action wait
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
      (connected ?from ?to)
      (travel_arrives ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting_at
    :parameters (?tr - traveler ?p - person ?loc - location ?t - time)
    :precondition (and
      (at ?tr ?loc)
      (person_at ?p ?loc)
      (current_time ?t)
      (available_at ?p ?t)
      (not (meeting_started ?p))
      (not (met ?p))
    )
    :effect (and
      (meeting_started ?p)
      (meeting_began_at ?p ?t)
    )
  )

  (:action complete_meeting_30
    :parameters (?tr - traveler ?p - person ?loc - location ?start - time ?end - time)
    :precondition (and
      (meeting_started ?p)
      (meeting_began_at ?p ?start)
      (at ?tr ?loc)
      (person_at ?p ?loc)
      (current_time ?end)
      (meeting_30_from_to ?p ?start ?end)
    )
    :effect (and
      (met ?p)
    )
  )
)