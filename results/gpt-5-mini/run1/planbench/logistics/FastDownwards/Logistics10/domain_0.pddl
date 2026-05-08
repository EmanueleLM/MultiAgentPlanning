(define (domain multi-modal-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck
    airplane
    package
    location
    city
  )

  (:predicates
    ;; Location predicates (distinct predicates for each object class to keep typing explicit)
    (at-truck ?t - truck ?l - location)
    (at-plane ?ap - airplane ?l - location)
    (at-pkg ?p - package ?l - location)

    ;; Containment predicates
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?ap - airplane)

    ;; Geography / topology
    (in-city ?l - location ?c - city)
    (is-airport ?l - location)
    (airport-of ?c - city ?l - location)

    ;; Connectivity (encoded as static facts in the problem)
    (connected-within-city ?l1 - location ?l2 - location)
    (connected-airports ?a1 - location ?a2 - location)
  )

  ;; === Truck agent actions (namespaced) ===

  (:action truck-load-into-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-pkg ?p ?l))
    )
  )

  (:action truck-unload-from-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-pkg ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action truck-drive-within-city
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (connected-within-city ?from ?to)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; === Airplane agent actions (namespaced) ===

  (:action plane-load-into-airplane
    :parameters (?ap - airplane ?p - package ?loc - location)
    :precondition (and
      (is-airport ?loc)
      (at-plane ?ap ?loc)
      (at-pkg ?p ?loc)
    )
    :effect (and
      (in-plane ?p ?ap)
      (not (at-pkg ?p ?loc))
    )
  )

  (:action plane-unload-from-airplane
    :parameters (?ap - airplane ?p - package ?loc - location)
    :precondition (and
      (is-airport ?loc)
      (at-plane ?ap ?loc)
      (in-plane ?p ?ap)
    )
    :effect (and
      (at-pkg ?p ?loc)
      (not (in-plane ?p ?ap))
    )
  )

  (:action plane-fly-airplane
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (is-airport ?from)
      (is-airport ?to)
      (at-plane ?ap ?from)
      (connected-airports ?from ?to)
    )
    :effect (and
      (at-plane ?ap ?to)
      (not (at-plane ?ap ?from))
      ;; Note: packages inside the airplane remain (in-plane ...) and are therefore implicitly moved with it.
    )
  )
)