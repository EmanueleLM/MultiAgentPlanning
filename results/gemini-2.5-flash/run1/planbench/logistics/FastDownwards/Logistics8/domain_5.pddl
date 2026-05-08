(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    thing ; Supertype for anything that can be "at" a location
    package - thing
    vehicle - thing ; Supertype for anything that transports and moves
    truck - vehicle
    airplane - vehicle
  )
  (:predicates
    (at ?obj - thing ?loc - location)
    (in ?pkg - package ?veh - vehicle) ; Package ?pkg is inside vehicle ?veh
    (loc-in-city ?loc - location ?city - city) ; Location ?loc is part of ?city
    (is-airport ?loc - location) ; Location ?loc is an airport
    (road ?l1 - location ?l2 - location) ; Explicit road connection for trucks within a city
    (air-route ?l1 - location ?l2 - location) ; Explicit air route connection for airplanes between airports
  )

  (:action load-package-truck
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

  (:action unload-package-truck
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

  (:action load-package-airplane
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

  (:action unload-package-airplane
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

  (:action drive-truck
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at ?truck ?from)
      (road ?from ?to) ; Explicit road connection
      (loc-in-city ?from ?city)
      (loc-in-city ?to ?city)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  (:action fly-airplane
    :parameters (?airplane - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and
      (at ?airplane ?from)
      (is-airport ?from)
      (is-airport ?to)
      (air-route ?from ?to) ; Explicit air route connection
      (loc-in-city ?from ?from_city)
      (loc-in-city ?to ?to_city)
      (not (= ?from_city ?to_city)) ; Airplanes fly between cities
      (not (= ?from ?to)) ; Must fly to a different airport
    )
    :effect (and
      (not (at ?airplane ?from))
      (at ?airplane ?to)
    )
  )
)