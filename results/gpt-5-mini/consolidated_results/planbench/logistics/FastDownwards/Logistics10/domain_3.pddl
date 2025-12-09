(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city stage)

  (:predicates
    ;; static / geographic relations (treated as static facts in the problem file)
    (in-city ?l - location ?c - city)
    (same-city ?l1 - location ?l2 - location)
    (different ?l1 - location ?l2 - location)
    (is-airport ?l - location)
    (next ?s1 - stage ?s2 - stage)

    ;; stage progression (global discrete time)
    (current-stage ?s - stage)

    ;; dynamic state
    (at-truck ?t - truck ?l - location)
    (at-airplane ?ap - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?ap - airplane)
  )

  ;; Truck actions (namespaced: truck-*)
  ;; All actions consume the current stage and advance to its successor to enforce discrete,
  ;; contiguous occupancy of intermediate stages and to prevent oscillation within a single stage.
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location ?st - stage ?st2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (at-package ?p ?l)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?l))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location ?st - stage ?st2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-truck ?p ?t))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?st - stage ?st2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (same-city ?from ?to)
      (different ?from ?to)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ;; Airplane actions (namespaced: plane-*)
  (:action plane-load
    :parameters (?ap - airplane ?p - package ?l - location ?st - stage ?st2 - stage)
    :precondition (and
      (is-airport ?l)
      (at-airplane ?ap ?l)
      (at-package ?p ?l)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (in-airplane ?p ?ap)
      (not (at-package ?p ?l))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action plane-unload
    :parameters (?ap - airplane ?p - package ?l - location ?st - stage ?st2 - stage)
    :precondition (and
      (is-airport ?l)
      (at-airplane ?ap ?l)
      (in-airplane ?p ?ap)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-airplane ?p ?ap))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action plane-fly
    :parameters (?ap - airplane ?from - location ?to - location ?st - stage ?st2 - stage)
    :precondition (and
      (at-airplane ?ap ?from)
      (is-airport ?from)
      (is-airport ?to)
      (not (same-city ?from ?to))
      (different ?from ?to)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (at-airplane ?ap ?to)
      (not (at-airplane ?ap ?from))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )
)