(define (domain city-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck - vehicle
    airplane - vehicle
    package
    stage
  )

  (:predicates
    ;; Static/topology
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
    (truck-connected ?l1 - location ?l2 - location)
    (air-route ?l1 - location ?l2 - location)

    ;; Temporal ordering
    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)

    ;; Time-indexed positions (state at a given stage)
    (at-truck ?t - truck ?loc - location ?s - stage)
    (at-airplane ?a - airplane ?loc - location ?s - stage)
    (at-package ?p - package ?loc - location ?s - stage)

    ;; Package in vehicle (time-independent token that persists until explicitly removed)
    (in-vehicle ?p - package ?v - vehicle)
  )

  ;; Drive truck within same city along truck-connected edges, advancing stage.
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?from ?s)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (truck-connected ?from ?to)
    )
    :effect (and
      (not (at-truck ?tr ?from ?s))
      (at-truck ?tr ?to ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Fly airplane between airports (air-route), advancing stage.
  (:action fly-airplane
    :parameters (?ap - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?from ?s)
      (airport ?from)
      (airport ?to)
      (air-route ?from ?to)
    )
    :effect (and
      (not (at-airplane ?ap ?from ?s))
      (at-airplane ?ap ?to ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Load package into truck (co-location at current stage), advancing stage.
  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?loc ?s)
      (at-package ?pkg ?loc ?s)
      (not (in-vehicle ?pkg ?tr))
    )
    :effect (and
      (not (at-package ?pkg ?loc ?s))
      (in-vehicle ?pkg ?tr)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload package from truck to truck's location at successor stage.
  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?loc ?s)
      (in-vehicle ?pkg ?tr)
    )
    :effect (and
      (not (in-vehicle ?pkg ?tr))
      (at-package ?pkg ?loc ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Load package into airplane at an airport, advancing stage.
  (:action airplane-load
    :parameters (?ap - airplane ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?loc ?s)
      (airport ?loc)
      (at-package ?pkg ?loc ?s)
      (not (in-vehicle ?pkg ?ap))
    )
    :effect (and
      (not (at-package ?pkg ?loc ?s))
      (in-vehicle ?pkg ?ap)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload package from airplane at an airport, placing it at the airport at successor stage.
  (:action airplane-unload
    :parameters (?ap - airplane ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?loc ?s)
      (airport ?loc)
      (in-vehicle ?pkg ?ap)
    )
    :effect (and
      (not (in-vehicle ?pkg ?ap))
      (at-package ?pkg ?loc ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

)