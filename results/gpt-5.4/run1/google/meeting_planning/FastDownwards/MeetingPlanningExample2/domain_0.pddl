(define (domain san_francisco_meet_jessica)
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
    (travel_link ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?t - timepoint)
    (meet_span ?t1 - timepoint ?t2 - timepoint)
    (met ?p - person)
    (meetable_at ?p - person ?l - location)
  )

  (:action wait
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (current_time ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?from_time - timepoint ?to_time - timepoint)
    :precondition (and
      (at ?from_loc)
      (current_time ?from_time)
      (travel_link ?from_loc ?to_loc ?from_time ?to_time)
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?from_time))
      (current_time ?to_time)
    )
  )

  (:action meet_person
    :parameters (?p - person ?loc - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?loc)
      (current_time ?start)
      (available ?p ?start)
      (meet_span ?start ?end)
      (meetable_at ?p ?loc)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)