(define (domain logistics)
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
    (at_package ?p - package ?l - location) ; Package is at a specific location (unloaded)
    (at_vehicle ?v - vehicle ?l - location) ; Vehicle is at a specific location
    (in ?pkg - package ?veh - vehicle)       ; Package is inside a vehicle
    (in_city ?loc - location ?city - city)   ; Location is part of a city
    (is_airport ?loc - location)             ; Location is an airport
  )

  ;; Action: Load a package into a truck
  ;; A package can be loaded into a truck only if the package and the truck are in the same location.
  ;; Once a package is loaded into a truck, the package is not at the location and is in the truck.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_vehicle ?t ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in ?p ?t)
    )
  )

  ;; Action: Unload a package from a truck
  ;; A package can be unloaded from a truck only if the package is in the truck.
  ;; Once a package is unloaded from a truck, the package is not in the truck and is at the location of the truck.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at_vehicle ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at_package ?p ?l)
    )
  )

  ;; Action: Drive a truck within a city
  ;; A truck can be driven from one location to another if the truck is at the from-location
  ;; and both from-location and to-location are locations in the same city.
  ;; Once a truck is driven from one location to another, it is not at the from-location and is at the to-location.
  ;; Note: Packages in the truck move implicitly with the truck, as their (at_package) state is false when (in) is true.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_vehicle ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (= ?from ?to)) ; Must drive to a different location
    )
    :effect (and
      (not (at_vehicle ?t ?from))
      (at_vehicle ?t ?to)
    )
  )

  ;; Action: Load a package into an airplane
  ;; A package can be loaded into an airplane only if the package and the airplane are in the same location.
  ;; Once a package is loaded into an airplane, the package is not at the location and is in the airplane.
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_vehicle ?a ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in ?p ?a)
    )
  )

  ;; Action: Unload a package from an airplane
  ;; A package can be unloaded from an airplane only if the package in the airplane.
  ;; Once a package is unloaded from an airplane, the package is not in the airplane and is at the location of the airplane.
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at_vehicle ?a ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at_package ?p ?l)
    )
  )

  ;; Action: Fly an airplane between airports in different cities
  ;; An airplane can be flown from one city to another if the from-location and the to-location are airports
  ;; and the airplane is at the from-location.
  ;; Once an airplane is flown from one city to another the airplane is not at the from-location and is at the to-location.
  ;; Note: Packages in the airplane move implicitly with the airplane, as their (at_package) state is false when (in) is true.
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and
      (at_vehicle ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (in_city ?from ?from_city)
      (in_city ?to ?to_city)
      (not (= ?from_city ?to_city)) ; Must fly between different cities
      (not (= ?from ?to)) ; Must fly to a different location
    )
    :effect (and
      (not (at_vehicle ?a ?from))
      (at_vehicle ?a ?to)
    )
  )
)