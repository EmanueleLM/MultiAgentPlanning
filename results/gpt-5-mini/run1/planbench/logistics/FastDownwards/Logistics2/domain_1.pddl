(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    airport - location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    ;; package at a location (only true when not inside any vehicle)
    (at_pkg ?p - package ?l - location)

    ;; vehicle at a location
    (at_veh ?v - vehicle ?l - location)

    ;; package inside a vehicle
    (in ?p - package ?v - vehicle)

    ;; auxiliary predicate: package currently in some vehicle
    (in_any ?p - package)

    ;; location -> city membership
    (in_city ?l - location ?c - city)

    ;; explicit airport marker (useful for clarity even though airports are typed)
    (is_airport ?l - location)

    ;; explicit different-city relation between two locations (used to allow flights only between different cities)
    (different_city ?l1 - location ?l2 - location)
  )

  ;; Truck actions
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
      (not (= ?from ?to))
    )
    :effect (and
      (at_veh ?t ?to)
      (not (at_veh ?t ?from))
    )
  )

  ;; Airplane actions
  (:action airplane-load
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_veh ?a ?l)
      (at_pkg ?p ?l)
      (not (in_any ?p))
    )
    :effect (and
      (in ?p ?a)
      (in_any ?p)
      (not (at_pkg ?p ?l))
    )
  )

  (:action airplane-unload
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at_veh ?a ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in ?p ?a))
      (not (in_any ?p))
    )
  )

  (:action airplane-fly
    :parameters (?a - airplane ?src - location ?dst - location)
    :precondition (and
      (at_veh ?a ?src)
      (is_airport ?src)
      (is_airport ?dst)
      (different_city ?src ?dst)
      (not (= ?src ?dst))
    )
    :effect (and
      (at_veh ?a ?dst)
      (not (at_veh ?a ?src))
      ;; packages that are (in ?p ?a) remain in the airplane (no change to (in ...) / (in_any ...))
    )
  )
)