(define (domain meet_david_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    friend
    location
    time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (connected ?from - location ?to - location)
    (travel_arrival ?from - location ?to - location ?depart - time ?arrive - time)
    (next_time ?t1 - time ?t2 - time)
    (friend_at ?f - friend ?l - location)
    (available_start ?f - friend ?t - time)
    (available_end ?f - friend ?t - time)
    (meeting_duration_slot ?start - time ?end - time)
    (met ?f - friend)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at you ?from)
      (current_time ?depart)
      (connected ?from ?to)
      (travel_arrival ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at you ?from))
      (at you ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_david
    :parameters (?start - time ?end - time)
    :precondition (and
      (at you chinatown)
      (friend_at david chinatown)
      (current_time ?start)
      (available_start david ?start)
      (meeting_duration_slot ?start ?end)
      (available_end david t_9_45pm)
      (not (met david))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met david)
    )
  )
)