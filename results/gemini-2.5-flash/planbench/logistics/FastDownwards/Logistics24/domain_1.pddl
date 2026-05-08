(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    vehicle
    truck airplane - vehicle
    location
    city
  )

  (:predicates
    (at ?obj - (or package vehicle) ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (in-city ?loc - location ?city - city)
    (is-airport ?loc - location)
  )

  (:action load-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?truck ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?truck)
    )
  )

  (:action unload-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (in ?pkg ?truck)
      (at ?truck ?loc)
    )
    :effect (and
      (not (in ?pkg ?truck))
      (at ?pkg ?loc)
    )
  )

  (:action drive-truck
    :parameters (?truck - truck ?from_loc ?to_loc - location ?city - city)
    :precondition (and
      (at ?truck ?from_loc)
      (in-city ?from_loc ?city)
      (in-city ?to_loc ?city)
    )
    :effect (and
      (not (at ?truck ?from_loc))
      (at ?truck ?to_loc)
    )
  )

  (:action load-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?airplane ?loc)
    )
    :effect (and
      (not (at ?pkg ?loc))
      (in ?pkg ?airplane)
    )
  )

  (:action unload-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (in ?pkg ?airplane)
      (at ?airplane ?loc)
    )
    :effect (and
      (not (in ?pkg ?airplane))
      (at ?pkg ?loc)
    )
  )

  (:action fly-airplane
    :parameters (?airplane - airplane ?from_loc ?to_loc - location ?from_city ?to_city - city)
    :precondition (and
      (at ?airplane ?from_loc)
      (is-airport ?from_loc)
      (is-airport ?to_loc)
      (in-city ?from_loc ?from_city)
      (in-city ?to_loc ?to_city)
      (not (= ?from_city ?to_city))
    )
    :effect (and
      (not (at ?airplane ?from_loc))
      (at ?airplane ?to_loc)
    )
  )
)