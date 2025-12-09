(define (domain multi-transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle truck airplane
    package
    city
    location
  )

  (:predicates
    ; location predicates for each actor type
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    ; package-in-vehicle (vehicle is either truck or airplane)
    (in ?p - package ?v - vehicle)

    ; infrastructure and topological predicates
    (airport ?l - location)
    (same-city ?l1 - location ?l2 - location)

    ; availability predicates that are required preconditions
    (available ?t - truck)
    (available-airplane ?a - airplane)
  )

  ; -------------------------
  ; TRUCK actions (names prefixed with truck-)
  ; -------------------------
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (available ?t)
    )
    :effect (and
      (in ?p ?t)
      (not (at-pkg ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in ?p ?t)
      (available ?t)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?t ?from)
      (same-city ?from ?to)
      (available ?t)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
      ; packages inside the truck remain (no change to (in ?p ?t))
    )
  )

  ; -------------------------
  ; AIRPLANE actions (names prefixed with plane-)
  ; -------------------------
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airport ?l)
      (at-airplane ?a ?l)
      (at-pkg ?p ?l)
      (available-airplane ?a)
    )
    :effect (and
      (in ?p ?a)
      (not (at-pkg ?p ?l))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airport ?l)
      (at-airplane ?a ?l)
      (in ?p ?a)
      (available-airplane ?a)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in ?p ?a))
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (available-airplane ?a)
    )
    :effect (and
      (at-airplane ?a ?to)
      (not (at-airplane ?a ?from))
      ; packages inside the airplane remain (no change to (in ?p ?a))
    )
  )
)