(define (domain logistics32)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane - cargo
    location - place
    city - object
    cargo place - object
  )
  (:predicates
    (at ?obj - cargo ?loc - location)
    (in ?pkg - package ?veh - (either truck airplane))
    (in_city ?loc - location ?c - city)
    (is_airport ?loc - location)
  )

  (:action load_package_truck
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

  (:action unload_package_truck
    :parameters (?pkg - package ?trk - truck ?loc - location)
    :precondition (and
      (in ?pkg ?trk)
      (at ?trk ?loc)
    )
    :effect (and
      (not (in ?pkg ?trk))
      (at ?pkg ?loc)
    )
  )

  (:action load_package_airplane
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

  (:action unload_package_airplane
    :parameters (?pkg - package ?air - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?air)
      (at ?air ?loc)
    )
    :effect (and
      (not (in ?pkg ?air))
      (at ?pkg ?loc)
    )
  )

  (:action drive_truck
    :parameters (?trk - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?trk ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?trk ?from))
      (at ?trk ?to)
    )
  )

  (:action fly_airplane
    :parameters (?air - airplane ?from - location ?to - location ?city_from - city ?city_to - city)
    :precondition (and
      (at ?air ?from)
      (is_airport ?from)
      (is_airport ?to)
      (in_city ?from ?city_from)
      (in_city ?to ?city_to)
      (not (= ?city_from ?city_to))
    )
    :effect (and
      (not (at ?air ?from))
      (at ?air ?to)
    )
  )
)