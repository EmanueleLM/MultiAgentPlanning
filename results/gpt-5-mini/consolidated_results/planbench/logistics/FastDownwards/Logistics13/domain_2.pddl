(define (domain multi_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; vehicle/location and package/location and package/container
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-pkg ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; city membership used to constrain truck movement
    (loc-in-city ?l - location ?c - city)

    ;; airport designation used to constrain airplane operations
    (airport ?l - location)
  )

  ;; Truck actions (distinct from airplane actions)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at-truck ?t ?from)
                       (loc-in-city ?from ?c)
                       (loc-in-city ?to ?c))
    :effect (and (not (at-truck ?t ?from)) (at-truck ?t ?to))
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at-pkg ?p ?l) (at-truck ?t ?l))
    :effect (and (not (at-pkg ?p ?l)) (in-truck ?p ?t))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in-truck ?p ?t) (at-truck ?t ?l))
    :effect (and (not (in-truck ?p ?t)) (at-pkg ?p ?l))
  )

  ;; Airplane actions (distinct)
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at-plane ?a ?from) (airport ?from) (airport ?to) (not (= ?from ?to)))
    :effect (and (not (at-plane ?a ?from)) (at-plane ?a ?to))
  )

  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at-pkg ?p ?l) (at-plane ?a ?l) (airport ?l))
    :effect (and (not (at-pkg ?p ?l)) (in-plane ?p ?a))
  )

  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in-plane ?p ?a) (at-plane ?a ?l) (airport ?l))
    :effect (and (not (in-plane ?p ?a)) (at-pkg ?p ?l))
  )
)