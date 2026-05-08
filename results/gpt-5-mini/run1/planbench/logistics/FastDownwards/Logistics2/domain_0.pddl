(define (domain logistics_multiagent)
  (:requirements :typing :negative-preconditions)
  (:types
    city
    location
    airport - location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    ;; package and vehicle locations (kept separate to enforce single-location invariants)
    (at_pkg ?p - package ?l - location)
    (at_veh ?v - vehicle ?l - location)

    ;; package inside a vehicle
    (in ?p - package ?v - vehicle)

    ;; helper fluent: whether a package is currently in any vehicle
    ;; This explicitly enforces the "package is either at a location OR in exactly one vehicle" invariant:
    ;; load actions require (not (in_any ?p)); load sets in_any; unload clears in_any.
    (in_any ?p - package)

    ;; location -> city membership
    (in_city ?l - location ?c - city)

    ;; airports
    (is_airport ?l - location)

    ;; explicit predicate listing that two locations are in different cities.
    ;; We supply the correct facts in the problem initial state for the instance,
    ;; and use this predicate to require flights only between airports in different cities.
    (different_city ?l1 - location ?l2 - location)
  )

  ;; Truck agent actions (prefixed with 'truck-')
  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_veh ?t ?l)
      (at_pkg ?p ?l)
      (not (in_any ?p))
    )
    :effect (and
      (in ?p ?t)
      (in_any ?p)
      (not (at_pkg ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at_veh ?t ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in ?p ?t))
      (not (in_any ?p))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_veh ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (at_veh ?t ?to)
      (not (at_veh ?t ?from))
    )
  )

  ;; Airplane agent actions (prefixed with 'airplane-')
  (:action airplane-load
    :parameters (?p - package ?pl - airplane ?l - location)
    :precondition (and
      (at_veh ?pl ?l)
      (at_pkg ?p ?l)
      (not (in_any ?p))
    )
    :effect (and
      (in ?p ?pl)
      (in_any ?p)
      (not (at_pkg ?p ?l))
    )
  )

  (:action airplane-unload
    :parameters (?p - package ?pl - airplane ?l - location)
    :precondition (and
      (in ?p ?pl)
      (at_veh ?pl ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in ?p ?pl))
      (not (in_any ?p))
    )
  )

  ;; Fly action: requires both endpoints to be airports and explicitly requires different-city relation.
  (:action airplane-fly
    :parameters (?pl - airplane ?src - location ?dst - location)
    :precondition (and
      (at_veh ?pl ?src)
      (is_airport ?src)
      (is_airport ?dst)
      (different_city ?src ?dst)
    )
    :effect (and
      (at_veh ?pl ?dst)
      (not (at_veh ?pl ?src))
      ;; note: packages that are (in ?p ?pl) are intentionally preserved
      ;; by not touching (in ...) or (in_any ...). This follows the auditor
      ;; recommendation: moving a vehicle does not change 'in' bookkeeping.
    )
  )
)