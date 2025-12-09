(define (domain multi-transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle
    truck airplane - vehicle
    package
    city
    location
    stage
  )

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Load a package into a truck. Requires the truck and package to be co-located.
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (in ?p ?t)
      (not (at-pkg ?p ?l))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unload a package from a truck. Package becomes at the truck's current location.
  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (in ?p ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in ?p ?t))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Drive a truck between two locations that are in the same city.
  ;; The city is an explicit parameter to enforce the same-city constraint without implicit assumptions.
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Load a package into an airplane at an airport.
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (airport ?l)
      (at-airplane ?a ?l)
      (at-pkg ?p ?l)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (in ?p ?a)
      (not (at-pkg ?p ?l))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unload a package from an airplane at an airport.
  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (airport ?l)
      (at-airplane ?a ?l)
      (in ?p ?a)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in ?p ?a))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Fly an airplane between two airports.
  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (at-airplane ?a ?to)
      (not (at-airplane ?a ?from))
      ;; Packages in the airplane remain in the airplane across the flight (no change to (in ?p ?a)).
      (not (current ?s))
      (current ?s2)
    )
  )
)