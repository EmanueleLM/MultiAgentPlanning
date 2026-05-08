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
    :parameters (?a - agent ?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at ?a ?from)
      (current_time ?depart)
      (connected ?from ?to)
      (travel_arrival ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_david
    :parameters (?a - agent ?f - friend ?loc - location ?start - time ?end - time ?avail_end - time)
    :precondition (and
      (at ?a ?loc)
      (friend_at ?f ?loc)
      (current_time ?start)
      (available_start ?f ?start)
      (meeting_duration_slot ?start ?end)
      (available_end ?f ?avail_end)
      (not (met ?f))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?f)
    )
  )
)