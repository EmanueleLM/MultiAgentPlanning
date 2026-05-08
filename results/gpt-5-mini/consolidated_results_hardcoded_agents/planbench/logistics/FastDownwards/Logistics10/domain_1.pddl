(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; static/geographic relations
    (in-city ?l - location ?c - city)
    (same-city ?l1 - location ?l2 - location)
    (different ?l1 - location ?l2 - location)
    (is-airport ?l - location)

    ;; dynamic state
    (at-truck ?t - truck ?l - location)
    (at-airplane ?ap - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?ap - airplane)
  )

  ;; Truck actions (namespaced: truck-*)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-package ?p ?l)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-truck ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?t ?from)
      (same-city ?from ?to)
      (different ?from ?to)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; Airplane actions (namespaced: plane-*)
  (:action plane-load
    :parameters (?ap - airplane ?p - package ?l - location)
    :precondition (and
      (is-airport ?l)
      (at-airplane ?ap ?l)
      (at-package ?p ?l)
    )
    :effect (and
      (in-airplane ?p ?ap)
      (not (at-package ?p ?l))
    )
  )

  (:action plane-unload
    :parameters (?ap - airplane ?p - package ?l - location)
    :precondition (and
      (is-airport ?l)
      (at-airplane ?ap ?l)
      (in-airplane ?p ?ap)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-airplane ?p ?ap))
    )
  )

  (:action plane-fly
    :parameters (?ap - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?ap ?from)
      (is-airport ?from)
      (is-airport ?to)
      (not (same-city ?from ?to))
      (different ?from ?to)
    )
    :effect (and
      (at-airplane ?ap ?to)
      (not (at-airplane ?ap ?from))
    )
  )
)