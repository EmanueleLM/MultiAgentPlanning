(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    package vehicle - object
    truck plane - vehicle
    location city day
  )

  (:predicates
    (at ?obj - object ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (airport ?loc - location)
    (same-city ?l1 - location ?l2 - location)
    (air-connected ?from - location ?to - location)
    (now ?d - day)
    (succ ?d1 - day ?d2 - day)
  )

  ;; Truck actions: drive, load, unload
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?d - day)
    :precondition (and
      (at ?t ?from)
      (same-city ?from ?to)
      (now ?d)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action truck-load
    :parameters (?t - truck ?pkg - package ?loc - location ?d - day)
    :precondition (and
      (at ?t ?loc)
      (at ?pkg ?loc)
      (now ?d)
    )
    :effect (and
      (in ?pkg ?t)
      (not (at ?pkg ?loc))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?pkg - package ?loc - location ?d - day)
    :precondition (and
      (at ?t ?loc)
      (in ?pkg ?t)
      (now ?d)
    )
    :effect (and
      (not (in ?pkg ?t))
      (at ?pkg ?loc)
    )
  )

  ;; Plane actions: fly between airports, load, unload
  (:action plane-fly
    :parameters (?p - plane ?from - location ?to - location ?d - day)
    :precondition (and
      (at ?p ?from)
      (airport ?from)
      (airport ?to)
      (air-connected ?from ?to)
      (now ?d)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action plane-load
    :parameters (?p - plane ?pkg - package ?loc - location ?d - day)
    :precondition (and
      (at ?p ?loc)
      (at ?pkg ?loc)
      (airport ?loc)
      (now ?d)
    )
    :effect (and
      (in ?pkg ?p)
      (not (at ?pkg ?loc))
    )
  )

  (:action plane-unload
    :parameters (?p - plane ?pkg - package ?loc - location ?d - day)
    :precondition (and
      (at ?p ?loc)
      (in ?pkg ?p)
      (airport ?loc)
      (now ?d)
    )
    :effect (and
      (not (in ?pkg ?p))
      (at ?pkg ?loc)
    )
  )

  ;; Explicit stage progression: must advance through succ chain to reach later stages
  (:action advance-day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (now ?d1)
      (succ ?d1 ?d2)
    )
    :effect (and
      (not (now ?d1))
      (now ?d2)
    )
  )
)