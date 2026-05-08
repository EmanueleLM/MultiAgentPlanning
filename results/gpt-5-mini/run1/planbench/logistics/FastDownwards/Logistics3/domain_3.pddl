(define (domain logistics3)
  (:requirements :strips :typing)
  (:types
    city
    location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    ;; topology
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)
    (airport_connection ?from - location ?to - location)

    ;; dynamic state
    (at_vehicle ?v - vehicle ?loc - location)    ;; vehicle at a location
    (at_package ?p - package ?loc - location)    ;; package at a location (not in a vehicle)
    (in_vehicle ?p - package ?v - vehicle)       ;; package loaded into a vehicle
  )

  ;; load package into a truck (co-location required)
  (:action load_truck
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

  ;; unload package from truck to the truck's current location
  (:action unload_truck
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

  ;; load package into an airplane (must be at an airport)
  (:action load_airplane
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

  ;; unload package from airplane at its current airport location
  (:action unload_airplane
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

  ;; drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_vehicle ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_vehicle ?t ?from))
      (at_vehicle ?t ?to)
    )
  )

  ;; fly an airplane between explicitly connected airport locations
  (:action fly_airplane
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
    )
  )
)