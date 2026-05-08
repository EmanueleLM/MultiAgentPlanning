(define (domain san_francisco_day_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    location
    friend
    time
  )

  (:predicates
    (at ?p - traveler ?l - location)
    (current_time ?t - time)
    (connected ?from - location ?to - location)
    (travel_arrives ?from - location ?to - location ?start - time ?end - time)
    (meet30_end ?start - time ?end - time)
    (friend_at ?f - friend ?l - location)
    (available_start_for_meeting ?f - friend ?start - time)
    (met ?f - friend)
  )

  (:action travel
    :parameters (?p - traveler ?from - location ?to - location ?start - time ?end - time)
    :precondition (and
      (at ?p ?from)
      (current_time ?start)
      (connected ?from ?to)
      (travel_arrives ?from ?to ?start ?end)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (current_time ?start))
      (current_time ?end)
    )
  )

  (:action meet_friend_for_30
    :parameters (?p - traveler ?f - friend ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?p ?l)
      (friend_at ?f ?l)
      (current_time ?start)
      (available_start_for_meeting ?f ?start)
      (meet30_end ?start ?end)
      (not (met ?f))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?f)
    )
  )
)