(define (domain multiagent_transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location)

  (:predicates
    ;; Location predicates
    (package-at ?p - package ?l - location)
    (truck-at ?t - truck ?l - location)
    (plane-at ?a - airplane ?l - location)

    ;; In-vehicle predicates
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; Connectivity predicates (static)
    (road ?from - location ?to - location)
    (flight-route ?from - location ?to - location)
  )

  ;; Truck actions (prefixed with "truck-")
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (truck-at ?t ?l) (package-at ?p ?l))
    :effect (and (in-truck ?p ?t) (not (package-at ?p ?l)))
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (truck-at ?t ?l) (in-truck ?p ?t))
    :effect (and (package-at ?p ?l) (not (in-truck ?p ?t)))
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (truck-at ?t ?from) (road ?from ?to))
    :effect (and (truck-at ?t ?to) (not (truck-at ?t ?from)))
  )

  ;; Airplane actions (prefixed with "airplane-")
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (plane-at ?a ?l) (package-at ?p ?l))
    :effect (and (in-plane ?p ?a) (not (package-at ?p ?l)))
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (plane-at ?a ?l) (in-plane ?p ?a))
    :effect (and (package-at ?p ?l) (not (in-plane ?p ?a)))
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (plane-at ?a ?from) (flight-route ?from ?to))
    :effect (and (plane-at ?a ?to) (not (plane-at ?a ?from)))
  )
)