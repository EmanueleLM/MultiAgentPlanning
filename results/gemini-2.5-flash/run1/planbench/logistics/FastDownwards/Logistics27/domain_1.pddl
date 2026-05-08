(define (domain logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    truck
    airplane
  )

  (:predicates
    (at ?obj - (or package truck airplane) ?loc - location)
    (in-city ?loc - location ?city - city)
    (is-airport ?loc - location)
    (in ?pkg - package ?veh - (or truck airplane))
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
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at ?truck ?from)
      (in-city ?from ?city)
      (in-city ?to ?city)
      (not (= ?from ?to)) ; Truck must actually move
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
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
    :parameters (?airplane - airplane ?from - location ?to - location)
    :precondition (and
      (at ?airplane ?from)
      (is-airport ?from)
      (is-airport ?to)
      (not (= ?from ?to)) ; Airplane must actually move
    )
    :effect (and
      (not (at ?airplane ?from))
      (at ?airplane ?to)
    )
  )
)