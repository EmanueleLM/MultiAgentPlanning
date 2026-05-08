(define (domain orchestrator_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    package - object
    vehicle - object
    truck - vehicle
    plane - vehicle
    location
    airport - location
  )

  (:predicates
    ;; generic location predicate for both packages and vehicles
    (at ?o - object ?l - location)

    ;; package-in-vehicle relation
    (in ?p - package ?v - vehicle)

    ;; connectivity predicates
    (road ?l1 - location ?l2 - location)
    (air ?a1 - airport ?a2 - airport)
  )

  ;; Truck agent actions
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in ?p ?t)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?loc)
    )
  )

  ;; Airplane agent actions
  (:action plane-fly
    :parameters (?pl - plane ?from - airport ?to - airport)
    :precondition (and
      (at ?pl ?from)
      (air ?from ?to)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )

  (:action plane-load
    :parameters (?pl - plane ?p - package ?loc - airport)
    :precondition (and
      (at ?pl ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in ?p ?pl)
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?loc - airport)
    :precondition (and
      (at ?pl ?loc)
      (in ?p ?pl)
    )
    :effect (and
      (not (in ?p ?pl))
      (at ?p ?loc)
    )
  )
)