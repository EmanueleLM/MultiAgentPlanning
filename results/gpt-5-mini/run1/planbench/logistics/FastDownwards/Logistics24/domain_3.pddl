(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    package - object
    vehicle - object
    truck airplane - vehicle
    location
    city
  )

  (:predicates
    (at ?o - object ?l - location)
    (in ?p - package ?v - vehicle)
    (loc_in_city ?l - location ?c - city)
    (is_airport ?l - location)
  )

  ;; Drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Load a package into a truck (package and truck must be co-located)
  (:action load_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (at ?p ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  ;; Unload a package from a truck to the truck's current location
  (:action unload_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Fly an airplane between two airport locations
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  ;; Load a package into an airplane (must be at an airport)
  (:action load_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (at ?p ?l)
      (is_airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  ;; Unload a package from an airplane to the airplane's current airport location
  (:action unload_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (in ?p ?a)
      (is_airport ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )
)