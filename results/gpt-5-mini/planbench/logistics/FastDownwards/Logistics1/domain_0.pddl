(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; object location predicates
    (package-at ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; vehicle location predicates
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)

    ;; geography / infrastructure
    (located-in-city ?l - location ?c - city)
    (airport ?l - location)
    (road-connected ?l1 - location ?l2 - location)
  )

  ;; Truck drives only within same city between road-connected locations
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?tr ?from)
      (road-connected ?from ?to)
      (located-in-city ?from ?c)
      (located-in-city ?to ?c)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; Load package into truck: package must be at same location, not already in a vehicle
  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?tr ?loc)
      (package-at ?p ?loc)
      (not (in-truck ?p ?tr))
      (not (in-airplane ?p ?a)) ;; prevents loading if in any airplane
    )
    :effect (and
      (not (package-at ?p ?loc))
      (in-truck ?p ?tr)
    )
  )

  ;; Unload package from truck to location where the truck is
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

  ;; Airplane flies only between airports (both endpoints must be airport locations).
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

  ;; Load package into airplane: both package and airplane must be at same airport; package not in any vehicle
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (package-at ?p ?loc)
      (airport ?loc)
      (not (in-airplane ?p ?a))
      (not (in-truck ?p ?tr)) ;; prevents loading if in any truck
    )
    :effect (and
      (not (package-at ?p ?loc))
      (in-airplane ?p ?a)
    )
  )

  ;; Unload package from airplane at an airport location where the plane is
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