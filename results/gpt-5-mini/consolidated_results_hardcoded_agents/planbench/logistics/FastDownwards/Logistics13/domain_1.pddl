(define (domain multi_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane vehicle package)
  
  ;; vehicle subtyping: trucks and airplanes are vehicles (for readability)
  ;; (Note: PDDL typing is nominal; we keep explicit types for objects in the problem.)

  (:predicates
    ;; vehicle/location and package/location and package/container
    (at-veh ?v - vehicle ?l - location)
    (at-pkg ?p - package ?l - location)
    (in ?p - package ?v - vehicle)

    ;; city membership and intra-city relation used to constrain truck movement
    (loc-in-city ?l - location ?c - city)
    (same-city ?l1 - location ?l2 - location)

    ;; airport designation used to constrain airplane operations
    (airport ?l - location)
  )

  ;; Truck actions (distinct from airplane actions)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at-veh ?t ?from) (same-city ?from ?to))
    :effect (and (not (at-veh ?t ?from)) (at-veh ?t ?to))
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at-pkg ?p ?l) (at-veh ?t ?l))
    :effect (and (not (at-pkg ?p ?l)) (in ?p ?t))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at-veh ?t ?l))
    :effect (and (not (in ?p ?t)) (at-pkg ?p ?l))
  )

  ;; Airplane actions (distinct)
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at-veh ?a ?from) (airport ?from) (airport ?to) (not (same-city ?from ?to)))
    :effect (and (not (at-veh ?a ?from)) (at-veh ?a ?to))
  )

  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at-pkg ?p ?l) (at-veh ?a ?l) (airport ?l))
    :effect (and (not (at-pkg ?p ?l)) (in ?p ?a))
  )

  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at-veh ?a ?l) (airport ?l))
    :effect (and (not (in ?p ?a)) (at-pkg ?p ?l))
  )
)