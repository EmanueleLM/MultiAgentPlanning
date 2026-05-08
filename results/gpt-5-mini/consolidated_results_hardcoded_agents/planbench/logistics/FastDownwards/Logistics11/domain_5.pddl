(define (domain Logistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location stage)

  (:predicates
    ;; positions
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; infrastructure
    (is-airport ?l - location)
    (same-city ?l1 - location ?l2 - location)
    (air-route ?from - location ?to - location)

    ;; discrete global stage control (linear progression)
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Truck agent actions (agent-prefixed: truck-agent)
  (:action truck-agent-load
    :parameters (?t - truck ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action truck-agent-unload
    :parameters (?t - truck ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Single drive action: trucks move regardless of load; packages inside remain in-truck
  (:action truck-agent-drive
    :parameters (?t - truck ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (same-city ?from ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Airplane agent actions (agent-prefixed: airplane-agent)
  (:action airplane-agent-load
    :parameters (?a - airplane ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?loc)
      (at-package ?p ?loc)
      (is-airport ?loc)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-airplane ?p ?a)
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action airplane-agent-unload
    :parameters (?a - airplane ?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?loc)
      (in-airplane ?p ?a)
      (is-airport ?loc)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?loc)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Single fly action: airplanes move between airports regardless of load; packages inside remain in-airplane
  (:action airplane-agent-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (air-route ?from ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
      (not (current ?s))
      (current ?s2)
    )
  )
)