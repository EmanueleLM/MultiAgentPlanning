(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent friend location time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (friend_at ?f - friend ?l - location)
    (available ?f - friend ?t - time)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (can_travel ?from - location ?to - location ?depart - time ?arrive - time)
    (can_meet_min ?f - friend ?l - location ?start - time ?end - time)
    (met_min ?f - friend)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?a ?from)
      (current_time ?depart)
      (can_travel ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action wait
    :parameters (?from_t - time ?to_t - time)
    :precondition (and
      (current_time ?from_t)
      (next ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_minimum
    :parameters (?a - agent ?f - friend ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?a ?l)
      (friend_at ?f ?l)
      (current_time ?start)
      (available ?f ?start)
      (available ?f ?end)
      (can_meet_min ?f ?l ?start ?end)
      (not (met_min ?f))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_min ?f)
    )
  )
)