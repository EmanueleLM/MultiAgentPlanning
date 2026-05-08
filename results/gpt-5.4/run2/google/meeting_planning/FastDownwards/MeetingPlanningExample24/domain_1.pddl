(define (domain meetingplanningexample24_domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler friend location time
  )

  (:predicates
    (at_traveler ?l - location)
    (at_friend ?f - friend ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?from - location ?to - location ?depart - time ?arrive - time)
    (friend_window ?f - friend ?l - location ?start - time ?end - time)
    (met_matthew)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - time ?arrive - time)
    :precondition (and
      (at_traveler ?from)
      (current_time ?depart)
      (travel_edge ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at_traveler ?from))
      (at_traveler ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_matthew_for_30
    :parameters (?l - location ?start - time ?end - time)
    :precondition (and
      (current_time ?start)
      (at_traveler ?l)
      (at_friend matthew ?l)
      (friend_window matthew ?l ?start ?end)
      (not (met_matthew))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_matthew)
    )
  )
)