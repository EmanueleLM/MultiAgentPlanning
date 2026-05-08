(define (domain san_francisco_meet_emily)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (person_at ?p - person ?l - location)
    (wait_edge ?from - time ?to - time)
    (travel_edge ?from_loc - location ?to_loc - location ?depart - time ?arrive - time)
    (can_start_meeting ?p - person ?t - time)
    (meeting_15_edge ?p - person ?start - time ?end - time)
    (meeting_started ?p - person ?start - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?from - time ?to - time)
    :precondition (and
      (current_time ?from)
      (wait_edge ?from ?to)
      (not (meeting_started emily t_1930))
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
      (not (meeting_started emily t_1930))
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?t)
      (can_start_meeting ?p ?t)
      (not (met ?p))
      (not (meeting_started ?p ?t))
    )
    :effect (and
      (meeting_started ?p ?t)
    )
  )

  (:action finish_meeting_15
    :parameters (?p - person ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?l)
      (person_at ?p ?l)
      (current_time ?start)
      (meeting_started ?p ?start)
      (meeting_15_edge ?p ?start ?end)
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (not (meeting_started ?p ?start))
      (met ?p)
    )
  )
)