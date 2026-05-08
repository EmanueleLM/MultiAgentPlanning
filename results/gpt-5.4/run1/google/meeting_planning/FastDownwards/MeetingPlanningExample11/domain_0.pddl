(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (can_wait ?l - location ?from - time ?to - time)
    (can_travel ?from_loc - location ?to_loc - location ?from_t - time ?to_t - time)
    (person_at ?p - person ?l - location)
    (meeting_interval ?p - person ?start - time ?end - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?l - location ?from - time ?to - time)
    :precondition (and
      (at ?l)
      (current_time ?from)
      (can_wait ?l ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?from_t - time ?to_t - time)
    :precondition (and
      (at ?from_loc)
      (current_time ?from_t)
      (can_travel ?from_loc ?to_loc ?from_t ?to_t)
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_person
    :parameters (?p - person ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?l)
      (current_time ?start)
      (person_at ?p ?l)
      (meeting_interval ?p ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)