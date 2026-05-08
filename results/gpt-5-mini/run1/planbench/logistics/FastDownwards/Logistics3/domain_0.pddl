(define (domain air-truck-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck - vehicle
    airplane - vehicle
    package
  )

  (:predicates
    ;; static/topological
    (in ?loc - location ?c - city)
    (airport ?loc - location)
    (airport_connection ?from - location ?to - location)
    (connected_truck ?from - location ?to - location)

    ;; dynamic state
    (at_vehicle ?v - vehicle ?loc - location)    ;; vehicle (truck/airplane) at a location
    (at_package ?p - package ?loc - location)    ;; package at a location (not in a vehicle)
    (in_vehicle ?p - package ?v - vehicle)       ;; package loaded in a vehicle
  )

  ;; Load a package into a truck at the same location.
  ;; Requires the truck and the package to be co-located.
  (:action load-into-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_vehicle ?t ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (in_vehicle ?p ?t)
      (not (at_package ?p ?l))
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  (:action unload-from-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_vehicle ?p ?t)
      (at_vehicle ?t ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in_vehicle ?p ?t))
    )
  )

  ;; Load a package into an airplane at an airport location.
  (:action load-into-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (airport ?l)
      (at_vehicle ?a ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (in_vehicle ?p ?a)
      (not (at_package ?p ?l))
    )
  )

  ;; Unload a package from an airplane at an airport location.
  (:action unload-from-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (airport ?l)
      (in_vehicle ?p ?a)
      (at_vehicle ?a ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in_vehicle ?p ?a))
    )
  )

  ;; Drive a truck between connected locations (ground connections).
  ;; Note: connected_truck facts determine allowed truck moves for the instance.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at_vehicle ?t ?from)
      (connected_truck ?from ?to)
    )
    :effect (and
      (not (at_vehicle ?t ?from))
      (at_vehicle ?t ?to)
      ;; packages loaded in the truck remain in_vehicle and thus move implicitly with the truck
    )
  )

  ;; Fly an airplane between connected airports.
  ;; airport_connection facts determine allowed flights for the instance.
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_vehicle ?a ?from)
      (airport ?from)
      (airport ?to)
      (airport_connection ?from ?to)
    )
    :effect (and
      (not (at_vehicle ?a ?from))
      (at_vehicle ?a ?to)
      ;; packages loaded in the airplane remain in_vehicle and thus move implicitly with the airplane
    )
  )
)