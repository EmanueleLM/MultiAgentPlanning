(define (domain logistics-multiagent)
  (:requirements :strips :typing)
  (:types
    object vehicle package truck plane location city
    vehicle - object
    truck plane - vehicle
    package - object
  )

  (:predicates
    (at ?o - object ?l - location)        ; object (package or vehicle) at a location
    (in ?p - package ?v - vehicle)        ; package is inside a vehicle (truck or plane)
    (is-airport ?l - location)            ; location is an airport
    (in-city ?l - city)                   ; location belongs to a city
  )

  ;; Truck-actions (intra-city)
  (:action truck_load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at ?t ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?loc))
    )
  )

  (:action truck_unload
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

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)   ; enforce driving only within the same city
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Plane-actions (inter-city, between airports)
  (:action plane_load
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and
      (at ?pl ?loc)
      (at ?p ?loc)
      (is-airport ?loc)    ; planes load at airports (planes operate between airports)
    )
    :effect (and
      (in ?p ?pl)
      (not (at ?p ?loc))
    )
  )

  (:action plane_unload
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and
      (at ?pl ?loc)
      (in ?p ?pl)
      (is-airport ?loc)
    )
    :effect (and
      (not (in ?p ?pl))
      (at ?p ?loc)
    )
  )

  (:action plane_fly
    :parameters (?pl - plane ?from - location ?to - location)
    :precondition (and
      (at ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )
)