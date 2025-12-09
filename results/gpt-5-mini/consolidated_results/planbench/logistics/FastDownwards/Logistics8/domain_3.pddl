(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    vehicle
      truck plane - vehicle
    location
    city
    stage
  )

  (:predicates
    ;; vehicle locations (for trucks and planes)
    (at-veh ?v - vehicle ?l - location)
    ;; package locations (package is at a location)
    (at-package ?p - package ?l - location)
    ;; package inside a vehicle
    (in ?p - package ?v - vehicle)

    ;; airport marker for locations
    (airport ?l - location)

    ;; truck local connectivity (locations in the same city)
    (same-city ?l1 - location ?l2 - location)

    ;; airplane connectivity between airports (explicit)
    (air-connected ?from - location ?to - location)

    ;; explicit discrete stage/time progression
    (now ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Truck actions
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?s - stage)
    :precondition (and
      (at-veh ?t ?from)
      (same-city ?from ?to)
      (now ?s)
    )
    :effect (and
      (not (at-veh ?t ?from))
      (at-veh ?t ?to)
    )
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location ?s - stage)
    :precondition (and
      (at-veh ?t ?loc)
      (at-package ?p ?loc)
      (now ?s)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in ?p ?t)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location ?s - stage)
    :precondition (and
      (at-veh ?t ?loc)
      (in ?p ?t)
      (now ?s)
    )
    :effect (and
      (not (in ?p ?t))
      (at-package ?p ?loc)
    )
  )

  ;; Plane actions
  (:action plane-fly
    :parameters (?pl - plane ?from - location ?to - location ?s - stage)
    :precondition (and
      (at-veh ?pl ?from)
      (airport ?from)
      (airport ?to)
      (air-connected ?from ?to)
      (now ?s)
    )
    :effect (and
      (not (at-veh ?pl ?from))
      (at-veh ?pl ?to)
    )
  )

  (:action plane-load
    :parameters (?pl - plane ?p - package ?loc - location ?s - stage)
    :precondition (and
      (at-veh ?pl ?loc)
      (at-package ?p ?loc)
      (airport ?loc)
      (now ?s)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in ?p ?pl)
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?loc - location ?s - stage)
    :precondition (and
      (at-veh ?pl ?loc)
      (in ?p ?pl)
      (airport ?loc)
      (now ?s)
    )
    :effect (and
      (not (in ?p ?pl))
      (at-package ?p ?loc)
    )
  )

  ;; Explicit stage progression: must be used to advance time.
  ;; This enforces that actions tied to later stages cannot be executed
  ;; before the successor relation is navigated.
  (:action advance-stage
    :parameters (?s1 - stage ?s2 - stage)
    :precondition (and
      (now ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (now ?s1))
      (now ?s2)
    )
  )
)