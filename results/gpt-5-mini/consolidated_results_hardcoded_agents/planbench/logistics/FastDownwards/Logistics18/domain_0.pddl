(define (domain cargo_orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck package location city airplane)

  (:predicates
    ; dynamic/location predicates
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)
    (pkg-at ?p - package ?l - location)

    ; in-vehicle predicates
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ; static / bookkeeping predicates
    (location-in-city ?l - location ?c - city)
    (airport ?l - location)
    (truck-of-city ?t - truck ?c - city)

    ; helper predicate to enforce package exclusivity:
    ; true exactly when the package is not inside any vehicle (i.e., available at a location)
    (pkg-free ?p - package)
  )

  ; Load a package from a location into a truck.
  ; Precondition requires the truck and package to be co-located and the package to be free.
  ; Effect is atomic: package is removed from the location and becomes in-truck; pkg-free is cleared.
  (:action load-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (pkg-at ?p ?l)
      (pkg-free ?p)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (pkg-at ?p ?l))
      (not (pkg-free ?p))
    )
  )

  ; Unload a package from a truck to the truck's current location.
  ; The location ?l is explicitly bound to the truck's location to avoid stale placement.
  (:action unload-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (pkg-at ?p ?l)
      (not (in-truck ?p ?t))
      (pkg-free ?p)
    )
  )

  ; Drive a truck within its designated city from ?from to ?to.
  ; Enforces same-city constraint via truck-of-city and location-in-city.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (truck-of-city ?t ?c)
      (location-in-city ?from ?c)
      (location-in-city ?to ?c)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
      ; packages in-truck remain in-truck (no changes to in-truck facts)
    )
  )

  ; Load a package from a location (airport) into an airplane.
  ; Requires co-location at an airport and that the package is free.
  (:action load-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (pkg-at ?p ?l)
      (airport ?l)
      (pkg-free ?p)
    )
    :effect (and
      (in-airplane ?p ?a)
      (not (pkg-at ?p ?l))
      (not (pkg-free ?p))
    )
  )

  ; Unload a package from an airplane to the airplane's current airport location.
  (:action unload-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (in-airplane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (pkg-at ?p ?l)
      (not (in-airplane ?p ?a))
      (pkg-free ?p)
    )
  )

  ; Fly an airplane between airports. Packages in the airplane remain in-airplane.
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane-at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (airplane-at ?a ?to)
      (not (airplane-at ?a ?from))
      ; in-airplane facts persist (packages travel with the airplane)
    )
  )
)