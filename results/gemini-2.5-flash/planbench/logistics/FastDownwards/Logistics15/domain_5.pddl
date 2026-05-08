(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    thing
    package - thing
    truck - thing
    airplane - thing
  )
  (:predicates
    (at ?obj - thing ?loc - location)
    (in-truck ?pkg - package ?t - truck)
    (in-airplane ?pkg - package ?a - airplane)
    (loc-in-city ?loc - location ?c - city)
    (is-airport ?loc - location)
  )

  ;; Action: Load a package into a truck
  ;; A package can be loaded into a truck only if the package and the truck are in the same location.
  ;; Once a package is loaded into a truck, the package is not at the location and is in the truck.
  (:action load_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in-truck ?p ?t)
    )
  )

  ;; Action: Unload a package from a truck
  ;; A package can be unloaded from a truck only if the package is in the truck.
  ;; Once a package is unloaded from a truck, the package is not in the truck and is at the location of the truck.
  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Action: Load a package into an airplane
  ;; A package can be loaded into an airplane only if the package and the airplane are in the same location.
  ;; Once a package is loaded into an airplane, the package is not at the location and is in the airplane.
  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
      (is-airport ?l) ; Packages can only be loaded onto an airplane at an airport.
    )
    :effect (and
      (not (at ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  ;; Action: Unload a package from an airplane
  ;; A package can be unloaded from an airplane only if the package in the airplane.
  ;; Once a package is unloaded from an airplane, the package is not in the airplane and is at the location of the airplane.
  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at ?a ?l)
      (is-airport ?l) ; Packages can only be unloaded from an airplane at an airport.
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at ?p ?l)
    )
  )

  ;; Action: Drive a truck from one location to another within the same city
  ;; A truck can be driven from one location to another if the truck is at the from-location
  ;; and both from-location and to-location are locations in the same city.
  ;; Once a truck is driven from one location to another, it is not at the from-location and is at the to-location.
  (:action drive_truck
    :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
    :precondition (and
      (at ?t ?l_from)
      (loc-in-city ?l_from ?c)
      (loc-in-city ?l_to ?c)
      (not (= ?l_from ?l_to)) ; Truck must move to a different location
    )
    :effect (and
      (not (at ?t ?l_from))
      (at ?t ?l_to)
    )
  )

  ;; Action: Fly an airplane from one city to another city (via airports)
  ;; An airplane can be flown from one city to another if the from-location and the to-location are airports
  ;; and the airplane is at the from-location.
  ;; Once an airplane is flown from one city to another the airplane is not at the from-location and is at the to-location.
  (:action fly_airplane
    :parameters (?a - airplane ?l_from - location ?l_to - location)
    :precondition (and
      (at ?a ?l_from)
      (is-airport ?l_from)
      (is-airport ?l_to)
      (not (= ?l_from ?l_to)) ; Airplane must fly to a different airport
    )
    :effect (and
      (not (at ?a ?l_from))
      (at ?a ?l_to)
    )
  )
)