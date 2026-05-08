(define (domain logistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; vehicle and package locations
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; package loaded in vehicles
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; location and city relations
    (airport ?l - location)
    (loc-in ?l - location ?c - city)
  )

  ;; Drive a truck between two locations in the same city.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (loc-in ?from ?c)
      (loc-in ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Load a package into a truck (package and truck must be co-located).
  (:action load-into-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-package ?p ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  (:action unload-from-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?l)
    )
  )

  ;; Fly an airplane between two airports (airports are locations).
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?c1 - city ?c2 - city)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (loc-in ?from ?c1)
      (loc-in ?to ?c2)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )

  ;; Load a package into an airplane (only at an airport).
  (:action load-into-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-airplane ?a ?l)
      (at-package ?p ?l)
      (airport ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  ;; Unload a package from an airplane to the airplane's current location (an airport).
  (:action unload-from-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-airplane ?a ?l)
      (in-airplane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?l)
    )
  )
)