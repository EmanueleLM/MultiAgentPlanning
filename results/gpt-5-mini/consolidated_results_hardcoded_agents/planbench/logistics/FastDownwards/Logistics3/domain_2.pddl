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
    ;; Topology
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
    (air-route ?l1 - location ?l2 - location)

    ;; Stage ordering
    (succ ?s1 - stage ?s2 - stage)
    (current-stage ?s - stage)

    ;; Time-indexed positions
    (at-truck ?tr - truck ?loc - location ?s - stage)
    (at-airplane ?ap - airplane ?loc - location ?s - stage)
    (at-package ?p - package ?loc - location ?s - stage)

    ;; Package inside vehicle (not time-indexed; persists until explicitly removed)
    (in-vehicle ?p - package ?v - vehicle)
  )

  ;; Drive a truck within the same city, advancing the current stage.
  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?from ?s)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?tr ?from ?s))
      (at-truck ?tr ?to ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Fly an airplane between airports (air-route), advancing the current stage.
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

  ;; Load a package into a truck (co-location at current stage), advancing stage.
  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?loc ?s)
      (at-package ?pkg ?loc ?s)
    )
    :effect (and
      (not (at-package ?pkg ?loc ?s))
      (in-vehicle ?pkg ?tr)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload a package from a truck to the truck's location at successor stage.
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

  ;; Load a package into an airplane at an airport, advancing stage.
  (:action airplane-load
    :parameters (?ap - airplane ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?loc ?s)
      (airport ?loc)
      (at-package ?pkg ?loc ?s)
    )
    :effect (and
      (not (at-package ?pkg ?loc ?s))
      (in-vehicle ?pkg ?ap)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload a package from an airplane at an airport, placing it at the airport at successor stage.
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

  ;; Persistence actions to propagate time-indexed facts to the successor stage
  ;; (these enforce contiguous occupancy unless changed by a primary action).
  (:action persist-truck
    :parameters (?tr - truck ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-truck ?tr ?loc ?s)
    )
    :effect (and
      (at-truck ?tr ?loc ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action persist-airplane
    :parameters (?ap - airplane ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-airplane ?ap ?loc ?s)
    )
    :effect (and
      (at-airplane ?ap ?loc ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action persist-package
    :parameters (?p - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (current-stage ?s)
      (succ ?s ?s2)
      (at-package ?p ?loc ?s)
    )
    :effect (and
      (at-package ?p ?loc ?s2)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)