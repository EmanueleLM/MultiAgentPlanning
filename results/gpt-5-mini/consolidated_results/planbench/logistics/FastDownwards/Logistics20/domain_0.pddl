(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; Positions
    (at ?o - (either package truck airplane) ?loc - location)

    ;; Containment
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (free ?p - package) ; package is not inside any vehicle

    ;; Infrastructure
    (road-connected ?l1 - location ?l2 - location) ; roads between locations
    (flight-route ?a1 - location ?a2 - location)   ; routes between airports (locations)
    (airport ?loc - location)                      ; marks airport locations
    (in-city ?loc - location ?c - city)            ; location belongs to a city
  )

  ;; Truck actions: load, unload, drive
  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
                    (at ?t ?loc)
                    (at ?p ?loc)
                    (free ?p)
                   )
    :effect (and
               (not (at ?p ?loc))
               (not (free ?p))
               (in-truck ?p ?t)
            )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
                    (at ?t ?loc)
                    (in-truck ?p ?t)
                   )
    :effect (and
               (not (in-truck ?p ?t))
               (at ?p ?loc)
               (free ?p)
            )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (at ?t ?from)
                    (road-connected ?from ?to)
                   )
    :effect (and
               (not (at ?t ?from))
               (at ?t ?to)
            )
  )

  ;; Airplane actions: load, unload, fly
  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
                    (at ?a ?loc)
                    (at ?p ?loc)
                    (airport ?loc)
                    (free ?p)
                   )
    :effect (and
               (not (at ?p ?loc))
               (not (free ?p))
               (in-plane ?p ?a)
            )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
                    (at ?a ?loc)
                    (in-plane ?p ?a)
                    (airport ?loc)
                   )
    :effect (and
               (not (in-plane ?p ?a))
               (at ?p ?loc)
               (free ?p)
            )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
                    (at ?a ?from)
                    (airport ?from)
                    (airport ?to)
                    (flight-route ?from ?to)
                   )
    :effect (and
               (not (at ?a ?from))
               (at ?a ?to)
            )
  )
)