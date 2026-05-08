(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    vehicle package - object
    truck plane - vehicle
    location city day
  )

  (:predicates
    ;; general location of any object (vehicles and packages)
    (at ?obj - object ?loc - location)

    ;; package inside a vehicle
    (in ?pkg - package ?veh - vehicle)

    ;; which locations are airports
    (airport ?loc - location)

    ;; static connectivity: locations in the same city (for truck movement)
    (same-city ?l1 - location ?l2 - location)

    ;; static connectivity for air transport (airports)
    (air-connected ?from - location ?to - location)

    ;; discrete stage/time modeling
    (now ?d - day)
    (succ ?d1 - day ?d2 - day)
  )

  ;; Truck actions
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

  ;; Plane actions
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

  ;; explicit stage progression (discrete time windows)
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