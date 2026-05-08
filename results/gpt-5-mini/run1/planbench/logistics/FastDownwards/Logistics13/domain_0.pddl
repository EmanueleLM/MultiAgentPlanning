(define (domain multiagent-transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle truck airplane package location airport - location)
  ;; Predicates
  (:predicates
    (at-package ?p - package ?l - location)                ; package is at a location (not loaded)
    (in-truck ?p - package ?t - truck)                    ; package is loaded in a truck
    (in-plane ?p - package ?a - airplane)                 ; package is loaded in an airplane
    (truck-at ?t - truck ?l - location)                   ; truck is at a location
    (plane-at ?a - airplane ?ap - airport)                ; airplane is at an airport
    (road-connected ?l1 - location ?l2 - location)        ; road connectivity for trucks
    (air-connected ?ap1 - airport ?ap2 - airport)         ; air connectivity for airplanes
    (is-airport ?ap - airport)                            ; marks airport locations
  )

  ;; Truck actions (explicitly distinct)
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (at-package ?p ?l)
      (not (in-plane ?p ?a))   ; package must not be in any plane (negative precondition over any plane handled at grounding)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
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
      (truck-at ?t ?from)
      (road-connected ?from ?to)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;; Airplane actions (explicitly distinct)
  (:action plane-load
    :parameters (?a - airplane ?p - package ?ap - airport)
    :precondition (and
      (plane-at ?a ?ap)
      (at-package ?p ?ap)
      (is-airport ?ap)
      (not (in-truck ?p ?t))  ; package must not be in any truck (negative precondition over any truck handled at grounding)
    )
    :effect (and
      (in-plane ?p ?a)
      (not (at-package ?p ?ap))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?ap - airport)
    :precondition (and
      (plane-at ?a ?ap)
      (in-plane ?p ?a)
      (is-airport ?ap)
    )
    :effect (and
      (at-package ?p ?ap)
      (not (in-plane ?p ?a))
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - airport ?to - airport)
    :precondition (and
      (plane-at ?a ?from)
      (air-connected ?from ?to)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (plane-at ?a ?to)
      (not (plane-at ?a ?from))
    )
  )
)