(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    traveler friend - agent
    location
    time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_time_7 ?from - location ?to - location ?t1 - time ?t2 - time)
    (meeting_slot ?f - friend ?l - location ?start - time ?end - time)
    (met ?f - friend)
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
    :parameters (?from - location ?to - location ?start - time ?end - time)
    :precondition (and
      (at you ?from)
      (connected ?from ?to)
      (current_time ?start)
      (travel_time_7 ?from ?to ?start ?end)
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?start))
      (current_time ?end)
    )
  )

  (:action meet_friend
    :parameters (?f - friend ?l - location ?start - time ?end - time)
    :precondition (and
      (at you ?l)
      (current_time ?start)
      (meeting_slot ?f ?l ?start ?end)
      (not (met ?f))
    )
    :effect (and
      (met ?f)
      (not (current_time ?start))
      (current_time ?end)
    )
  )
)