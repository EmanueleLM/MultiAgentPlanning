(define (domain meet_jason_san_francisco_day)
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
    (travel_edge ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?start - time ?end - time)
    (meeting_slot ?p - person ?loc - location ?start - time ?end - time)
  )

  (:action travel
    :parameters (?tr - traveler ?from - location ?to - location ?start - time ?end - time)
    :precondition (and
      (at ?tr ?from)
      (current_time ?start)
      (travel_edge ?from ?to)
      (travel_arrives ?from ?to ?start ?end)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (not (current_time ?start))
      (current_time ?end)
    )
  )

  (:action meet_person
    :parameters (?tr - traveler ?p - person ?loc - location ?start - time ?end - time)
    :precondition (and
      (at ?tr ?loc)
      (current_time ?start)
      (meeting_slot ?p ?loc ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)