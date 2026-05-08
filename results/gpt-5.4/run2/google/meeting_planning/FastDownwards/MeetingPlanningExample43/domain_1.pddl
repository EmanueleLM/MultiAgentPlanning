(define (domain meet_sandra_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:constants
    chinatown - location
    sandra - person
    t_0900 t_0915 t_0916 t_0931 t_1145 - timepoint
  )

  (:predicates
    (at ?l - location)
    (friend_at ?p - person ?l - location)
    (available ?p - person)
    (current_time ?t - timepoint)
    (travel_time ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (meeting_slot ?p - person ?start - timepoint ?end - timepoint)
    (met ?p - person)
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (travel_time ?from ?to ?depart ?arrive)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet
    :parameters (?p - person ?start - timepoint ?end - timepoint)
    :precondition (and
      (at chinatown)
      (friend_at ?p chinatown)
      (available ?p)
      (current_time ?start)
      (meeting_slot ?p ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )

  (:action wait_0900_0915
    :parameters ()
    :precondition (and
      (current_time t_0900)
      (available sandra)
    )
    :effect (and
      (not (current_time t_0900))
      (current_time t_0915)
    )
  )

  (:action wait_0915_0916
    :parameters ()
    :precondition (and
      (current_time t_0915)
      (available sandra)
    )
    :effect (and
      (not (current_time t_0915))
      (current_time t_0916)
    )
  )

  (:action wait_0916_0931
    :parameters ()
    :precondition (and
      (current_time t_0916)
      (available sandra)
    )
    :effect (and
      (not (current_time t_0916))
      (current_time t_0931)
    )
  )

  (:action wait_0931_1145
    :parameters ()
    :precondition (and
      (current_time t_0931)
      (available sandra)
    )
    :effect (and
      (not (current_time t_0931))
      (current_time t_1145)
      (not (available sandra))
    )
  )
)