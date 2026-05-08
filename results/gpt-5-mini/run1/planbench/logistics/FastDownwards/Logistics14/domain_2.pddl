(define (domain logistics14)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    ;; package / location / vehicle state
    (package-at ?p - package ?l - location)
    (truck-at ?t - truck ?l - location)
    (plane-at ?a - airplane ?l - location)

    ;; in-vehicle relations
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; geographic / infrastructure
    (in-city ?l - location ?c - city)
    (airport ?l - location)

    ;; structural binding: which city a truck belongs to (one truck per city)
    (truck-in-city ?t - truck ?c - city)
  )

  ;; Truck actions: can only drive between locations that are in the same city
  ;; and the truck must belong to that city (enforces "one truck per city" invariant).
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?c - city)
    :precondition (and
      (truck-at ?t ?l)
      (package-at ?p ?l)
      (in-city ?l ?c)
      (truck-in-city ?t ?c)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (package-at ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?c - city)
    :precondition (and
      (truck-at ?t ?l)
      (in-truck ?p ?t)
      (in-city ?l ?c)
      (truck-in-city ?t ?c)
    )
    :effect (and
      (package-at ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (truck-in-city ?t ?c)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;; Airplane actions: operate only at airport locations; airplanes can fly between airports.
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (plane-at ?a ?l)
      (package-at ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in-plane ?p ?a)
      (not (package-at ?p ?l))
    )
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (plane-at ?a ?l)
      (in-plane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (package-at ?p ?l)
      (not (in-plane ?p ?a))
    )
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (plane-at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (plane-at ?a ?to)
      (not (plane-at ?a ?from))
    )
  )
)