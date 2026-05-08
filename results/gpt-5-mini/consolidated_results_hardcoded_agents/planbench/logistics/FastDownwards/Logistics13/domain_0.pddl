(define (domain multi_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane - vehicle package location)

  (:predicates
    (at-veh ?v - vehicle ?l - location)
    (at-pkg ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (free ?p - package)
    (road-connected ?l1 - location ?l2 - location)
    (air-connected ?l1 - location ?l2 - location)
    (airport ?l - location)
  )

  ;; Truck actions (distinct from airplane actions)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at-veh ?t ?from) (road-connected ?from ?to))
    :effect (and (not (at-veh ?t ?from)) (at-veh ?t ?to))
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at-pkg ?p ?l) (at-veh ?t ?l) (free ?p) (not (airport ?l)))
    :effect (and (not (at-pkg ?p ?l)) (not (free ?p)) (in ?p ?t))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at-veh ?t ?l))
    :effect (and (at-pkg ?p ?l) (free ?p) (not (in ?p ?t)))
  )

  ;; Airplane actions (distinct)
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at-veh ?a ?from) (air-connected ?from ?to))
    :effect (and (not (at-veh ?a ?from)) (at-veh ?a ?to))
  )

  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at-pkg ?p ?l) (at-veh ?a ?l) (free ?p) (airport ?l))
    :effect (and (not (at-pkg ?p ?l)) (not (free ?p)) (in ?p ?a))
  )

  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at-veh ?a ?l) (airport ?l))
    :effect (and (at-pkg ?p ?l) (free ?p) (not (in ?p ?a)))
  )
)