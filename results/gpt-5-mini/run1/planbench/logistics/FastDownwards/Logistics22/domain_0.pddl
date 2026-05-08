(define (domain logistics-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck plane - vehicle
    vehicle
    package
    location
  )

  (:predicates
    ;; location membership for vehicles and packages
    (at ?x - (either vehicle package) ?loc - location)
    ;; package is loaded into a vehicle
    (in ?p - package ?v - vehicle)
    ;; vehicle has no package loaded (capacity 1)
    (free ?v - vehicle)
    ;; connectivity predicates for allowed movements
    (road ?l1 - location ?l2 - location)
    (airroute ?l1 - location ?l2 - location)
  )

  ;; Truck actions (namespaced)
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at ?t ?from) (road ?from ?to))
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at ?t ?loc) (at ?p ?loc) (free ?t))
    :effect (and
      (not (at ?p ?loc))
      (in ?p ?t)
      (not (free ?t))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at ?t ?loc) (in ?p ?t))
    :effect (and
      (not (in ?p ?t))
      (at ?p ?loc)
      (free ?t)
    )
  )

  ;; Airplane actions (namespaced)
  (:action plane-fly
    :parameters (?pl - plane ?from - location ?to - location)
    :precondition (and (at ?pl ?from) (airroute ?from ?to))
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )

  (:action plane-load
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and (at ?pl ?loc) (at ?p ?loc) (free ?pl))
    :effect (and
      (not (at ?p ?loc))
      (in ?p ?pl)
      (not (free ?pl))
    )
  )

  (:action plane-unload
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and (at ?pl ?loc) (in ?p ?pl))
    :effect (and
      (not (in ?p ?pl))
      (at ?p ?loc)
      (free ?pl)
    )
  )
)