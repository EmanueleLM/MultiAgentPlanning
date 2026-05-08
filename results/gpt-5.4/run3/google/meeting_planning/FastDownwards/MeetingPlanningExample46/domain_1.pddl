(define (domain san_francisco_meet_robert)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    friend
    location
    time
  )

  (:constants
    haight_ashbury north_beach - location
  )

  (:predicates
    (at_traveler ?p - traveler ?l - location)
    (at_friend ?f - friend ?l - location)
    (current_time ?t - time)
    (next_time ?from - time ?to - time)
    (travel_haight_to_north ?depart - time ?arrive - time)
    (travel_north_to_haight ?depart - time ?arrive - time)
    (meet90_start ?start - time ?end - time)
    (available_start ?f - friend ?t - time)
    (met_minimum ?f - friend)
  )

  (:action wait
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

  (:action move_haight_to_north
    :parameters (?p - traveler ?depart - time ?arrive - time)
    :precondition (and
      (at_traveler ?p haight_ashbury)
      (current_time ?depart)
      (travel_haight_to_north ?depart ?arrive)
    )
    :effect (and
      (not (at_traveler ?p haight_ashbury))
      (at_traveler ?p north_beach)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action move_north_to_haight
    :parameters (?p - traveler ?depart - time ?arrive - time)
    :precondition (and
      (at_traveler ?p north_beach)
      (current_time ?depart)
      (travel_north_to_haight ?depart ?arrive)
    )
    :effect (and
      (not (at_traveler ?p north_beach))
      (at_traveler ?p haight_ashbury)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_robert_for_90
    :parameters (?p - traveler ?f - friend ?start - time ?end - time)
    :precondition (and
      (current_time ?start)
      (at_traveler ?p north_beach)
      (at_friend ?f north_beach)
      (meet90_start ?start ?end)
      (available_start ?f ?start)
      (not (met_minimum ?f))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_minimum ?f)
    )
  )
)