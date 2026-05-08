(define (domain transport_combined)
  :requirements :strips :typing :negative-preconditions
  :types
    obj
    package - obj
    vehicle - obj
    truck - vehicle
    airplane - vehicle
    location
  :predicates
    (at ?o - obj ?l - location)          ; object (package or vehicle) is at location
    (in ?p - package ?v - vehicle)       ; package is loaded in vehicle
    (free ?p - package)                  ; package is not currently inside any vehicle
  ;; Truck actions (prefixed with 'truck_')
  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (at ?t ?l) (at ?p ?l) (free ?p) (not (in ?p ?t)))
    :effect (and (in ?p ?t) (not (at ?p ?l)) (not (free ?p)))
  )
  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (at ?t ?l) (in ?p ?t))
    :effect (and (not (in ?p ?t)) (at ?p ?l) (free ?p))
  )
  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at ?t ?from))
    :effect (and (at ?t ?to) (not (at ?t ?from)))
  )
  ;; Airplane actions (prefixed with 'airplane_')
  (:action airplane_load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (at ?a ?l) (at ?p ?l) (free ?p) (not (in ?p ?a)))
    :effect (and (in ?p ?a) (not (at ?p ?l)) (not (free ?p)))
  )
  (:action airplane_unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (at ?a ?l) (in ?p ?a))
    :effect (and (not (in ?p ?a)) (at ?p ?l) (free ?p))
  )
  (:action airplane_fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from))
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )
)