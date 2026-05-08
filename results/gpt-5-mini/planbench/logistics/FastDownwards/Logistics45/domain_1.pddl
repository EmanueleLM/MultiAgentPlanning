(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    airplane
    truck
    city
    location
    package
  )

  (:predicates
    ;; location properties
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)

    ;; vehicle locations
    (at_airplane ?a - airplane ?loc - location)
    (at_truck ?t - truck ?loc - location)

    ;; package state: either at a location or inside a vehicle
    (at_pkg ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
  )

  ;; load/unload truck
  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_truck ?t ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?loc)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  ;; load/unload airplane
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_airplane ?a ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_airplane ?p ?a)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?loc)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_pkg ?p ?loc)
    )
  )

  ;; drive truck within same city (requires both locations to be in same city)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; fly airplane between airports (airports are location objects marked as airport)
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)