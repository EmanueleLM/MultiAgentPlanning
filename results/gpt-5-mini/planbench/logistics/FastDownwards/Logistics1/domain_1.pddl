(define (domain logistics1)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    ;; package location / in-vehicle predicates
    (package-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; vehicle location predicates
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)

    ;; geography / infrastructure
    (located-in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Drive a truck between two locations in the same city
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?tr ?from)
      (located-in-city ?from ?c)
      (located-in-city ?to ?c)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Load a package into a truck (package and truck must be co-located)
  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (package-at ?p ?loc)
    )
    :effect (and
      (not (package-at ?p ?loc))
      (in-truck ?p ?tr)
    )
  )

  ;; Unload a package from a truck to the truck's current location
  (:action truck-unload
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (in-truck ?p ?tr)
    )
    :effect (and
      (not (in-truck ?p ?tr))
      (package-at ?p ?loc)
    )
  )

  ;; Fly an airplane between two airports
  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane-at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (airplane-at ?a ?from))
      (airplane-at ?a ?to)
    )
  )

  ;; Load a package into an airplane at an airport where both are located
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (package-at ?p ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (package-at ?p ?loc))
      (in-airplane ?p ?a)
    )
  )

  ;; Unload a package from an airplane at the airplane's current airport location
  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (in-airplane ?p ?a)
      (airport ?loc)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (package-at ?p ?loc)
    )
  )
)