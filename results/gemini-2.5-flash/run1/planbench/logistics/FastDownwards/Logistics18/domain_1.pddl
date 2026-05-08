(define (domain logistics18)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package vehicle location city - object
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - (or package vehicle) ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
  )

  (:action load_truck
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

  (:action unload_truck
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

  (:action drive_truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at ?truck ?from)
      (in_city ?from ?city)
      (in_city ?to ?city)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  (:action load_airplane
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

  (:action unload_airplane
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

  (:action fly_airplane
    :parameters (?airplane - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?airplane ?from)
      (is_airport ?from)
      (is_airport ?to)
      (in_city ?from ?from_city)
      (in_city ?to ?to_city)
      (not (= ?from_city ?to_city)) ; Airplanes fly between different cities
    )
    :effect (and
      (not (at ?airplane ?from))
      (at ?airplane ?to)
    )
  )
)