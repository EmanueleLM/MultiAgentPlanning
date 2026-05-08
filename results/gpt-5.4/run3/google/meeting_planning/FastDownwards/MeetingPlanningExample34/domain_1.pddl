(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (person_at ?p - person ?l - location)
    (available ?p - person ?from - time ?to - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (meeting_block ?p - person ?l - location ?start - time ?end - time)
    (met_minimum ?p - person)
  )

  (:action advance_time
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?from_loc)
      (current_time ?depart)
      (travel_edge ?from_loc ?to_loc ?depart ?arrive)
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_minimum_duration
    :parameters (?p - person ?l - location ?start - time ?end - time ?avail_end - time)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?start)
      (meeting_block ?p ?l ?start ?end)
      (available ?p ?start ?avail_end)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_minimum ?p)
    )
  )
)