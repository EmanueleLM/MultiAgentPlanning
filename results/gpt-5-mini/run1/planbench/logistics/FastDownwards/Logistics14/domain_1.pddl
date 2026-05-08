(define (domain logistics14)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; package/location/vehicle state
    (package-at ?p - package ?l - location)
    (truck-at ?t - truck ?l - location)
    (plane-at ?a - airplane ?l - location)

    ;; in-vehicle relations
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; geographic / infrastructure
    (in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Truck actions: can only drive between locations that are in the same city
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
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (truck-at ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (truck-at ?t ?to) (not (truck-at ?t ?from)))
  )

  ;; Airplane actions: airplanes operate at airport locations
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (plane-at ?a ?l) (package-at ?p ?l) (airport ?l))
    :effect (and (in-plane ?p ?a) (not (package-at ?p ?l)))
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (plane-at ?a ?l) (in-plane ?p ?a) (airport ?l))
    :effect (and (package-at ?p ?l) (not (in-plane ?p ?a)))
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (plane-at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (plane-at ?a ?to) (not (plane-at ?a ?from)))
  )
)