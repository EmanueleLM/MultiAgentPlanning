(define (domain transport-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; Generic at predicate for trucks, airplanes, and packages
    (at ?obj - (either truck airplane package) ?loc - location)
    ;; package contained in a vehicle
    (in ?p - package ?v - (either truck airplane))
    ;; ground connectivity between locations (direct drivable road)
    (road ?from - location ?to - location)
    ;; air connectivity between locations (direct fly route)
    (air-route ?from - location ?to - location)
    ;; mapping of location to city (optional grouping)
    (in-city ?loc - location ?c - city)
  )

  ;; Truck actions (distinct agent)
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
                   (at ?p ?l)
                   (at ?t ?l)
                   (not (in ?p ?t))
                  )
    :effect (and
             (in ?p ?t)
             (not (at ?p ?l))
            )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
                   (in ?p ?t)
                   (at ?t ?l)
                  )
    :effect (and
             (at ?p ?l)
             (not (in ?p ?t))
            )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                   (at ?t ?from)
                   (road ?from ?to)
                  )
    :effect (and
             (not (at ?t ?from))
             (at ?t ?to)
            )
  )

  ;; Airplane actions (distinct agent). Included for completeness; may be unused.
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
                   (at ?p ?l)
                   (at ?a ?l)
                   (not (in ?p ?a))
                  )
    :effect (and
             (in ?p ?a)
             (not (at ?p ?l))
            )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
                   (in ?p ?a)
                   (at ?a ?l)
                  )
    :effect (and
             (at ?p ?l)
             (not (in ?p ?a))
            )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
                   (at ?a ?from)
                   (air-route ?from ?to)
                  )
    :effect (and
             (not (at ?a ?from))
             (at ?a ?to)
            )
  )
)