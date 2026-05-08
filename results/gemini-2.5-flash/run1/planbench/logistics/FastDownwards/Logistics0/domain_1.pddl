(define (domain integrated-logistics)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types
    package - object
    location - object
    city - object
    vehicle - object ; Supertype for ground and air transport
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - (either package vehicle) ?loc - location) ; Fixed syntax: (either package vehicle)
    (on-board ?pkg - package ?veh - vehicle) ; Unified predicate for packages on any vehicle
    (in-city ?loc - location ?city - city)
    (assigned-to ?truck - truck ?city - city) ; Trucks are assigned to operate within a specific city
    (ground-connected ?loc1 ?loc2 - location ?city - city) ; For intra-city ground routes
    (is-airport ?loc - location) ; Indicates a location can serve as an airport
  )

  ;; Action for a truck to load a package
  (:action load-package-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?truck ?loc)
      (not (on-board ?pkg ?truck))
    )
    :effect (and
      (not (at ?pkg ?loc))
      (on-board ?pkg ?truck)
    )
  )

  ;; Action for a truck to unload a package
  (:action unload-package-truck
    :parameters (?pkg - package ?truck - truck ?loc - location)
    :precondition (and
      (on-board ?pkg ?truck)
      (at ?truck ?loc)
    )
    :effect (and
      (not (on-board ?pkg ?truck))
      (at ?pkg ?loc)
    )
  )

  ;; Action for a truck to drive between locations within the same city
  (:action drive-truck
    :parameters (?truck - truck ?from ?to - location ?city - city)
    :precondition (and
      (at ?truck ?from)
      (in-city ?from ?city)
      (in-city ?to ?city)
      (assigned-to ?truck ?city)
      (ground-connected ?from ?to ?city) ; Ensures intra-city ground route
      (not (= ?from ?to)) ; Truck must actually move between distinct locations
    )
    :effect (and
      (not (at ?truck ?from))
      (at ?truck ?to)
    )
  )

  ;; Action to load a package onto an airplane at an airport
  (:action load-package-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (at ?pkg ?loc)
      (at ?airplane ?loc)
      (is-airport ?loc)
      (not (on-board ?pkg ?airplane))
    )
    :effect (and
      (not (at ?pkg ?loc))
      (on-board ?pkg ?airplane)
    )
  )

  ;; Action to unload a package from an airplane to an airport
  (:action unload-package-airplane
    :parameters (?pkg - package ?airplane - airplane ?loc - location)
    :precondition (and
      (on-board ?pkg ?airplane)
      (at ?airplane ?loc)
      (is-airport ?loc)
    )
    :effect (and
      (not (on-board ?pkg ?airplane))
      (at ?pkg ?loc)
    )
  )

  ;; Action for an airplane to fly between two airports
  (:action fly-airplane
    :parameters (?airplane - airplane ?from ?to - location)
    :precondition (and
      (at ?airplane ?from)
      (is-airport ?from)
      (is-airport ?to)
      (not (= ?from ?to)) ; Airplane must actually move between distinct airports
    )
    :effect (and
      (not (at ?airplane ?from))
      (at ?airplane ?to)
    )
  )
)