(define (domain san_francisco_robert_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    friend
    location
    timepoint
  )

  (:predicates
    (at ?p - traveler ?l - location)
    (friend_at ?f - friend ?l - location)
    (available_at ?f - friend ?t - timepoint)
    (current_time ?t - timepoint)
    (can_travel_by ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    (met_90 ?f - friend)
  )

  (:action travel_by_deadline
    :parameters (?p - traveler ?from - location ?to - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (current_time ?t1)
      (at ?p ?from)
      (can_travel_by ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action meet_for_90_from_t_1630_to_t_1800
    :parameters (?p - traveler ?f - friend ?l - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (current_time ?start)
      (at ?p ?l)
      (friend_at ?f ?l)
      (available_at ?f ?start)
      (available_at ?f ?end)
      (not (met_90 ?f))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_90 ?f)
    )
  )
)