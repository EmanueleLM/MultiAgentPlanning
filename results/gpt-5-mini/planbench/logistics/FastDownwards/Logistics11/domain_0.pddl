(define (domain transport-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle truck airplane location city airport package)
  (:predicates
    ; vehicle locations
    (at ?v - vehicle ?loc - location)
    ; package is at a location (not in any vehicle)
    (at-pkg ?p - package ?loc - location)
    ; package is inside a vehicle
    (in ?p - package ?v - vehicle)
    ; connectivity predicates (static facts)
    (road-connected ?l1 - location ?l2 - location)
    (air-route ?l1 - location ?l2 - location)
    ; location types
    (airport ?loc - location)
    (city ?loc - location)
    ; vehicle capacity flag: true when empty (capacity 1)
    (empty ?v - vehicle)
  )

  ;----------------------------------------
  ; Truck agent actions (names prefixed with "truck-")
  ;----------------------------------------
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at ?t ?from) (road-connected ?from ?to))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at ?t ?loc) (at-pkg ?p ?loc) (empty ?t))
    :effect (and (not (at-pkg ?p ?loc)) (in ?p ?t) (not (empty ?t)))
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at ?t ?loc) (in ?p ?t))
    :effect (and (not (in ?p ?t)) (at-pkg ?p ?loc) (empty ?t))
  )

  ;----------------------------------------
  ; Airplane agent actions (names prefixed with "airplane-")
  ; Airplane actions are restricted to airports as locations for loads/unloads/flys
  ;----------------------------------------
  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to) (air-route ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  (:action airplane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and (at ?a ?loc) (airport ?loc) (at-pkg ?p ?loc) (empty ?a))
    :effect (and (not (at-pkg ?p ?loc)) (in ?p ?a) (not (empty ?a)))
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and (at ?a ?loc) (airport ?loc) (in ?p ?a))
    :effect (and (not (in ?p ?a)) (at-pkg ?p ?loc) (empty ?a))
  )
)