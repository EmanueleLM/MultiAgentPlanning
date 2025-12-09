(define (domain transport-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city stage)

  (:predicates
    ;; Positions
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; Containment
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; Location properties and connectivity
    (airport ?l - location)
    (air-route ?l1 - location ?l2 - location)
    (location-in-city ?l - location ?c - city)

    ;; Discrete stage progression and current stage marker
    (successor ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)
  )

  ;; Truck actions advance the explicit stage marker from ?s to its successor ?next.

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?next - stage)
    :precondition (and
      (current-stage ?s)
      (successor ?s ?next)
      (at-package ?p ?l)
      (at-truck ?t ?l)
      (not (in-truck ?p ?t))
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
      (not (current-stage ?s))
      (current-stage ?next)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?next - stage)
    :precondition (and
      (current-stage ?s)
      (successor ?s ?next)
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?l)
      (not (current-stage ?s))
      (current-stage ?next)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?next - stage)
    :precondition (and
      (current-stage ?s)
      (successor ?s ?next)
      (at-truck ?t ?from)
      (location-in-city ?from ?c)
      (location-in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (current-stage ?s))
      (current-stage ?next)
    )
  )

  ;; Airplane actions advance the explicit stage marker from ?s to its successor ?next.

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location ?s - stage ?next - stage)
    :precondition (and
      (current-stage ?s)
      (successor ?s ?next)
      (at-package ?p ?l)
      (at-airplane ?a ?l)
      (airport ?l)
      (not (in-airplane ?p ?a))
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-airplane ?p ?a)
      (not (current-stage ?s))
      (current-stage ?next)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location ?s - stage ?next - stage)
    :precondition (and
      (current-stage ?s)
      (successor ?s ?next)
      (in-airplane ?p ?a)
      (at-airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?l)
      (not (current-stage ?s))
      (current-stage ?next)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?next - stage)
    :precondition (and
      (current-stage ?s)
      (successor ?s ?next)
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (air-route ?from ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
      (not (current-stage ?s))
      (current-stage ?next)
    )
  )
)