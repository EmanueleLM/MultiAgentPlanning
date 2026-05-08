(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; package at a location
    (at ?pkg - package ?loc - location)
    ;; truck at a location
    (at_truck ?truck - truck ?loc - location)
    ;; airplane at a location (airport)
    (at_plane ?plane - airplane ?loc - location)
    ;; package in a truck
    (in_truck ?pkg - package ?truck - truck)
    ;; package in an airplane
    (in_plane ?pkg - package ?plane - airplane)
    ;; location is an airport
    (is_airport ?loc - location)
    ;; location belongs to a city
    (in_city ?loc - location ?city - city)
    ;; static assignment: which city a truck operates in
    (truck_in_city ?truck - truck ?city - city)
  )

  ;; Truck actions
  (:action truck-load
    :parameters (?truck - truck ?pkg - package ?loc - location ?city - city)
    :precondition (and
      (at_truck ?truck ?loc)
      (at ?pkg ?loc)
      (truck_in_city ?truck ?city)
      (in_city ?loc ?city)
    )
    :effect (and
      (in_truck ?pkg ?truck)
      (not (at ?pkg ?loc))
    )
  )

  (:action truck-unload
    :parameters (?truck - truck ?pkg - package ?loc - location ?city - city)
    :precondition (and
      (at_truck ?truck ?loc)
      (in_truck ?pkg ?truck)
      (truck_in_city ?truck ?city)
      (in_city ?loc ?city)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in_truck ?pkg ?truck))
    )
  )

  (:action truck-drive
    :parameters (?truck - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at_truck ?truck ?from)
      (truck_in_city ?truck ?city)
      (in_city ?from ?city)
      (in_city ?to ?city)
    )
    :effect (and
      (not (at_truck ?truck ?from))
      (at_truck ?truck ?to)
    )
  )

  ;; Airplane actions
  (:action airplane-load
    :parameters (?plane - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at_plane ?plane ?loc)
      (at ?pkg ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (in_plane ?pkg ?plane)
      (not (at ?pkg ?loc))
    )
  )

  (:action airplane-unload
    :parameters (?plane - airplane ?pkg - package ?loc - location)
    :precondition (and
      (at_plane ?plane ?loc)
      (in_plane ?pkg ?plane)
      (is_airport ?loc)
    )
    :effect (and
      (at ?pkg ?loc)
      (not (in_plane ?pkg ?plane))
    )
  )

  (:action airplane-fly
    :parameters (?plane - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?plane ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at_plane ?plane ?from))
      (at_plane ?plane ?to)
    )
  )
)