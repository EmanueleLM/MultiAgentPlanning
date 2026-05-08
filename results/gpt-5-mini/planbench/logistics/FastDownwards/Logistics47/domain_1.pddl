(define (domain logistics47)
  (:requirements :strips :typing)
  (:types location city truck airplane package)

  (:predicates
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)

    ;; location predicates for typed objects
    (at_truck ?t - truck ?loc - location)
    (at_airplane ?a - airplane ?loc - location)
    (at_package ?p - package ?loc - location)

    ;; containment predicates
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
  )

  ;; load a package into a truck when both are at the same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (at_package ?p ?loc) (at_truck ?t ?loc))
    :effect (and (in_truck ?p ?t) (not (at_package ?p ?loc)))
  )

  ;; unload a package from a truck to the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in_truck ?p ?t) (at_truck ?t ?loc))
    :effect (and (at_package ?p ?loc) (not (in_truck ?p ?t)))
  )

  ;; load a package into an airplane when both are at the same location
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (at_package ?p ?loc) (at_airplane ?a ?loc))
    :effect (and (in_airplane ?p ?a) (not (at_package ?p ?loc)))
  )

  ;; unload a package from an airplane to the airplane's current location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (in_airplane ?p ?a) (at_airplane ?a ?loc))
    :effect (and (at_package ?p ?loc) (not (in_airplane ?p ?a)))
  )

  ;; drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at_truck ?t ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (at_truck ?t ?to) (not (at_truck ?t ?from)))
  )

  ;; fly an airplane between two airports
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at_airplane ?a ?from) (airport ?from) (airport ?to))
    :effect (and (at_airplane ?a ?to) (not (at_airplane ?a ?from)))
  )
)