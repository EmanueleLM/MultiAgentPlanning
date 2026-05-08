(define (domain transport-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    location
    city
    vehicle
    truck airplane - vehicle
  )

  ;; Type predicates / explicit identity predicates (static in problem)
  (:predicates
    (location ?l - location)
    (city ?c - city)

    (in-city ?l - location ?c - city)       ;; static: location -> city membership
    (airport ?l - location)                 ;; static: airports are locations

    (truck ?t - truck)
    (truck-of-city ?t - truck ?c - city)    ;; static mapping: exactly one truck per city

    (airplane ?a - airplane)

    (package ?p - package)

    ;; At predicates separated by object type to keep invariants explicit
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at ?p - package ?l - location)         ;; package is at a location (only if not in a vehicle)

    ;; Carried state: generic and specialized forms (kept consistent by actions)
    (in ?p - package ?v - vehicle)          ;; package is inside a vehicle (truck or airplane)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; Convenience per-package occupancy flag to enforce "not already loaded" in one check
    (in_any ?p - package)

    ;; Precomputed relation: two locations are in the same city
    (same-city ?l1 - location ?l2 - location)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions: truck-local actions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (package ?p)
      (truck ?t)
      (location ?l)
      (in-city ?l ?c)
      (truck-of-city ?t ?c)
      (at ?p ?l)              ;; package present at location
      (at-truck ?t ?l)        ;; truck present at same location
      (not (in_any ?p))       ;; package not already loaded in any vehicle
    )
    :effect (and
      (in ?p ?t)
      (in-truck ?p ?t)
      (in_any ?p)
      (not (at ?p ?l))
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?c - city)
    :precondition (and
      (package ?p)
      (truck ?t)
      (location ?l)
      (in-city ?l ?c)
      (truck-of-city ?t ?c)
      (in ?p ?t)
      (in-truck ?p ?t)
      (at-truck ?t ?l)       ;; ensure unload at truck's current location
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?t))
      (not (in-truck ?p ?t))
      (not (in_any ?p))
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck ?t)
      (location ?from)
      (location ?to)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (truck-of-city ?t ?c)   ;; ensures truck stays within its assigned city
      (at-truck ?t ?from)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
      ;; Packages carried in the truck remain in ?t (in/in-truck unchanged)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions: airplane / inter-city
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
      (package ?p)
      (airplane ?a)
      (location ?l)
      (airport ?l)
      (in-city ?l ?c)
      (at-airplane ?a ?l)
      (at ?p ?l)
      (not (in_any ?p))
    )
    :effect (and
      (in ?p ?a)
      (in-airplane ?p ?a)
      (in_any ?p)
      (not (at ?p ?l))
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location ?c - city)
    :precondition (and
      (package ?p)
      (airplane ?a)
      (location ?l)
      (airport ?l)
      (in-city ?l ?c)
      (in ?p ?a)
      (in-airplane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?a))
      (not (in-airplane ?p ?a))
      (not (in_any ?p))
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane ?a)
      (location ?from)
      (location ?to)
      (airport ?from)
      (airport ?to)
      (at-airplane ?a ?from)
      ;; require airports to be in different cities: not (same-city ?from ?to)
      (not (same-city ?from ?to))
    )
    :effect (and
      (at-airplane ?a ?to)
      (not (at-airplane ?a ?from))
      ;; Packages in ?a remain (in/in-airplane unchanged)
    )
  )

)