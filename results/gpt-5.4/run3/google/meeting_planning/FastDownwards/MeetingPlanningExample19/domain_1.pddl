(define (domain san_francisco_meet_john)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (at_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (person_at ?p - person ?l - location)
    (available_start ?p - person ?t - time)
    (available_end ?p - person ?t - time)
    (meeting_45_edge ?start - time ?end - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (at_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (at_time ?from))
      (at_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from_loc)
      (at_time ?depart)
      (travel_edge ?from_loc ?to_loc ?depart ?arrive)
      (not (at ?to_loc))
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (at_time ?depart))
      (at_time ?arrive)
    )
  )

  (:action meet_for_45
    :parameters (?p - person ?loc - location ?start - time ?end - time)
    :precondition (and
      (at ?loc)
      (person_at ?p ?loc)
      (at_time ?start)
      (meeting_45_edge ?start ?end)
      (available_start ?p t1945)
      (available_end ?p t2045)
      (not (met ?p))
    )
    :effect (and
      (not (at_time ?start))
      (at_time ?end)
      (met ?p)
    )
  )
)