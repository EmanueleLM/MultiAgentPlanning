(define (domain san_francisco_meeting_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    traveler
    friend
    location
    timepoint
  )

  (:constants
    chinatown - location
    sandra - friend
  )

  (:predicates
    (at ?p - traveler ?l - location)
    (current_time ?t - timepoint)
    (met ?f - friend)
    (connected ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (time_successor ?t1 - timepoint ?t2 - timepoint)
    (meeting_slot_sandra ?start - timepoint ?end - timepoint)
    (friend_at ?f - friend ?l - location)
  )

  (:action travel
    :parameters (?p - traveler ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?p ?from)
      (current_time ?depart)
      (connected ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action wait
    :parameters (?p - traveler ?l - location ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at ?p ?l)
      (current_time ?t1)
      (time_successor ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_sandra
    :parameters (?p - traveler ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?p chinatown)
      (current_time ?start)
      (friend_at sandra chinatown)
      (meeting_slot_sandra ?start ?end)
      (not (met sandra))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met sandra)
    )
  )
)