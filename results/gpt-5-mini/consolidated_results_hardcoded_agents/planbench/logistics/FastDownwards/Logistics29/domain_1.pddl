(define (domain logistics_combined)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck - vehicle
    airplane - vehicle
    package
  )

  (:predicates
    ; whereabouts: entities (vehicles and packages) at locations
    (at ?x - (either vehicle package) ?l - location)

    ; package containment in a vehicle
    (in ?p - package ?v - vehicle)

    ; static membership and airport flags
    (in_city ?l - location ?c - city)
    (airport ?l - location)

    ; helper predicate to require flights go between different cities (explicit facts provided in problem)
    (city-different ?c1 - city ?c2 - city)
  )

  ;; Truck agent actions (namespaced "truck-")
  ;; Load a package into a truck: package and truck must be co-located.
  ;; Result: package is no longer at the location and is in the truck.
  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  ;; Unload a package from a truck: package must be in the truck and the truck at the location.
  ;; Result: package is no longer in the truck and is at the truck's location.
  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Drive a truck between two locations inside the same city.
  ;; Precondition enforces truck at from-location and both locations belong to one city.
  ;; Result: truck no longer at from-location and is at to-location.
  ;; NOTE: Packages that are in the truck remain in the truck (the in predicate is unchanged).
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Air agent actions (namespaced "air-")
  ;; Load a package into an airplane at an airport: airplane and package must be co-located at an airport.
  (:action air-load
    :parameters (?p - package ?ap - airplane ?a - location)
    :precondition (and
      (airport ?a)
      (at ?ap ?a)
      (at ?p ?a)
    )
    :effect (and
      (not (at ?p ?a))
      (in ?p ?ap)
    )
  )

  ;; Unload a package from an airplane at an airport.
  (:action air-unload
    :parameters (?p - package ?ap - airplane ?a - location)
    :precondition (and
      (airport ?a)
      (at ?ap ?a)
      (in ?p ?ap)
    )
    :effect (and
      (not (in ?p ?ap))
      (at ?p ?a)
    )
  )

  ;; Fly an airplane between airports in different cities.
  ;; Precondition enforces origin and destination are airports and belong to different cities.
  (:action air-fly
    :parameters (?ap - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (airport ?from)
      (airport ?to)
      (at ?ap ?from)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
      (city-different ?cfrom ?cto)
    )
    :effect (and
      (not (at ?ap ?from))
      (at ?ap ?to)
    )
  )
)