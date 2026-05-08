(define (domain logistics-multiagent)
  (:requirements :strips :typing)
  (:types
    vehicle package truck plane location city object
  )
  ; Type hierarchy: truck and plane are vehicles; vehicle and package are objects.
  ; Using PDDL hyphen groups to declare hierarchy
  (:types vehicle package - object truck plane - vehicle location city)

  (:predicates
    (at ?o - object ?l - location)                ; object (package or vehicle) at a location
    (in ?p - package ?v - vehicle)                ; package is inside a vehicle
    (is-airport ?l - location)                    ; location is an airport
    (in-city ?l - location ?c - city)             ; location belongs to a city
    (connected ?from - location ?to - location)   ; direct drive connection (one-way)
  )

  ; Truck actions (prefix truck_)
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
      (connected ?from ?to)
      (in-city ?from ?c)
      (in-city ?to ?c)  ; enforce driving only within the same city
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ; Plane actions (prefix plane_)
  (:action plane_load
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and
      (at ?pl ?loc)
      (at ?p ?loc)
      (is-airport ?loc)    ; loading only at airports
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
      (is-airport ?loc)    ; unloading only at airports
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