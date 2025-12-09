(define (domain logistics_combined)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    city
    location
    truck
    airplane
    package
    stage
  )

  (:predicates
    ; vehicle locations
    (at-truck ?t - truck ?l - location)
    (at-airplane ?ap - airplane ?l - location)

    ; package at a location (not inside a vehicle)
    (at-p ?p - package ?l - location)

    ; package containment (distinct predicates for truck vs airplane)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?ap - airplane)

    ; static membership and airport flags
    (in_city ?l - location ?c - city)
    (airport ?l - location)

    ; explicit cross-city relation (used to require flights between different cities)
    (diff-city ?c1 - city ?c2 - city)

    ; discrete stage progression for explicit ordering of actions
    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; All actions require a current stage ?s and a successor stage ?s2, and they advance the current-stage.
  ;; This enforces a single-threaded discrete progression and makes ordering explicit.

  ;; Truck actions (namespaced "truck-")
  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-p ?p ?l)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (at-p ?p ?l))
      (in-truck ?p ?t)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-p ?p ?l)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (at-truck ?t ?to)) ; prevent null/identity drives
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Air actions (namespaced "air-")
  (:action air-load
    :parameters (?p - package ?ap - airplane ?a - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (airport ?a)
      (at-p ?p ?a)
      (at-airplane ?ap ?a)
    )
    :effect (and
      (not (at-p ?p ?a))
      (in-airplane ?p ?ap)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action air-unload
    :parameters (?p - package ?ap - airplane ?a - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (airport ?a)
      (in-airplane ?p ?ap)
      (at-airplane ?ap ?a)
    )
    :effect (and
      (not (in-airplane ?p ?ap))
      (at-p ?p ?a)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action air-fly
    :parameters (?ap - airplane ?from - location ?to - location ?cfrom - city ?cto - city ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (airport ?from)
      (airport ?to)
      (at-airplane ?ap ?from)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
      (diff-city ?cfrom ?cto)
      (not (at-airplane ?ap ?to)) ; prevent null/identity flights
    )
    :effect (and
      (not (at-airplane ?ap ?from))
      (at-airplane ?ap ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)