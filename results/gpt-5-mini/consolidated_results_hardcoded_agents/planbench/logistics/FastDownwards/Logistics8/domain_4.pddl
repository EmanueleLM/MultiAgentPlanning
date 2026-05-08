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

  ;; Truck actions advance time from one stage to its successor.
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-veh ?t ?from)
      (same-city ?from ?to)
      (now ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (at-veh ?t ?from))
      (at-veh ?t ?to)
      (not (now ?s1))
      (now ?s2)
    )
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-veh ?t ?loc)
      (at-package ?p ?loc)
      (now ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in ?p ?t)
      (not (now ?s1))
      (now ?s2)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-veh ?t ?loc)
      (in ?p ?t)
      (now ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (in ?p ?t))
      (at-package ?p ?loc)
      (not (now ?s1))
      (now ?s2)
    )
  )

  ;; Plane actions also advance time explicitly.
  (:action plane-fly
    :parameters (?pl - plane ?from - location ?to - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-veh ?pl ?from)
      (airport ?from)
      (airport ?to)
      (air-connected ?from ?to)
      (now ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (at-veh ?pl ?from))
      (at-veh ?pl ?to)
      (not (now ?s1))
      (now ?s2)
    )
  )

  (:action plane-load
    :parameters (?pl - plane ?p - package ?loc - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-veh ?pl ?loc)
      (at-package ?p ?loc)
      (airport ?loc)
      (now ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in ?p ?pl)
      (not (now ?s1))
      (now ?s2)
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?loc - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-veh ?pl ?loc)
      (in ?p ?pl)
      (airport ?loc)
      (now ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (not (in ?p ?pl))
      (at-package ?p ?loc)
      (not (now ?s1))
      (now ?s2)
    )
  )
)