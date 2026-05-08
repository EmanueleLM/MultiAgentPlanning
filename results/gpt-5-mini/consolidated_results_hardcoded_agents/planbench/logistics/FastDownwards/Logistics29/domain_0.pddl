(define (domain logistics_combined)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    city
    entity
    location - entity
    vehicle - entity
    truck - vehicle
    airplane - vehicle
    package - entity
  )

  (:predicates
    ; canonical location/containment predicates
    (at ?e - entity ?l - location)            ; entity (package or vehicle) is at location
    (in ?p - package ?v - vehicle)            ; package is inside vehicle

    ; membership and airport flags
    (in_city ?x - entity ?c - city)           ; a location or vehicle belongs to a city
    (airport ?l - location)                   ; location is an airport

    ; bookkeeping predicates to enforce exclusivity and capacity (capacity forced to 1 for safety)
    (pkg-free ?p - package)                   ; package is not in any vehicle (i.e., is at a location)
    (capacity-free ?v - vehicle)              ; vehicle has at least one free capacity slot

    ; helper predicate to enforce inter-city flight precondition (inequality)
    (city-different ?c1 - city ?c2 - city)
  )

  ;; Truck agent actions (namespaced with "truck-")
  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
      (in_city ?l ?c)
      (in_city ?t ?c)
      (pkg-free ?p)
      (capacity-free ?t)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
      (not (pkg-free ?p))
      (not (capacity-free ?t))
    )
  )

  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
      (in_city ?l ?c)
      (in_city ?t ?c)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
      (pkg-free ?p)
      (capacity-free ?t)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (in_city ?t ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Air agent actions (namespaced with "air-")
  (:action air-load
    :parameters (?p - package ?ap - airplane ?a - location)
    :precondition (and
      (airport ?a)
      (at ?ap ?a)
      (at ?p ?a)
      (pkg-free ?p)
      (capacity-free ?ap)
    )
    :effect (and
      (not (at ?p ?a))
      (in ?p ?ap)
      (not (pkg-free ?p))
      (not (capacity-free ?ap))
    )
  )

  (:action air-unload
    :parameters (?p - package ?ap - airplane ?a - location)
    :precondition (and
      (airport ?a)
      (at ?ap ?a)
      (in ?p ?ap)
    )
    :effect (and
      (not (in ?p ?ap))
      (at ?p ?a)
      (pkg-free ?p)
      (capacity-free ?ap)
    )
  )

  (:action air-fly
    :parameters (?ap - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (airport ?from)
      (airport ?to)
      (at ?ap ?from)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
      (city-different ?cfrom ?cto)
    )
    :effect (and
      (not (at ?ap ?from))
      (at ?ap ?to)
    )
  )
)