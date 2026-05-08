(define (domain logistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    vehicle
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - (either package vehicle) ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (in-city ?loc - location ?city - city)
    (is-airport ?loc - location)
  )

  (:action load_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?trk ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?trk)
    )
  )

  (:action unload_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and
      (in ?pkg ?trk)
      (at ?trk ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?trk))
    )
  )

  (:action load_airplane
    :parameters (?pkg - package ?air - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?air ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?air)
    )
  )

  (:action unload_airplane
    :parameters (?pkg - package ?air - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?air)
      (at ?air ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in ?pkg ?air))
    )
  )

  (:action drive_truck
    :parameters (?trk - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at ?trk ?from)
      (in-city ?from ?city)
      (in-city ?to ?city)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?trk ?from))
      (at ?trk ?to)
    )
  )

  (:action fly_airplane
    :parameters (?air - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?air ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?from_city)
      (in-city ?to ?to_city)
      (not (= ?from_city ?to_city))
    )
    :effect (and
      (not (at ?air ?from))
      (at ?air ?to)
    )
  )