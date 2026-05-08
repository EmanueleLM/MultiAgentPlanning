(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location time package vehicle truck airplane
  )
  (:predicates
    ;; Positions of vehicles (trucks and airplanes)
    (at ?v - vehicle ?loc - location)

    ;; Package location or containment (exclusive by effects)
    (at-pkg ?p - package ?loc - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; Infrastructure
    (airport ?loc - location)
    (in-city ?loc - location ?c - city)

    ;; Explicit ordered stages (discrete time steps / action stages)
    (stage ?s - time)
    (succ ?s1 - time ?s2 - time)
    (current-stage ?s - time)
  )

  ;; ACTIONS: every action must explicitly advance the current stage (succ),
  ;; which enforces an ordered, single-action-per-stage execution.
  ;; Preconditions reference the current stage and the successor stage;
  ;; effects update the world fluents and advance the current stage.

  ;; Truck: load package into truck (requires package and truck at same location)
  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location ?s ?s2 - time)
    :precondition (and
      (at ?tr ?loc)
      (at-pkg ?p ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; package ceases to be at the location and becomes in the truck
      (not (at-pkg ?p ?loc))
      (in-truck ?p ?tr)

      ;; advance the global stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Truck: unload package from truck (package becomes at truck's location)
  (:action truck-unload
    :parameters (?tr - truck ?p - package ?loc - location ?s ?s2 - time)
    :precondition (and
      (at ?tr ?loc)
      (in-truck ?p ?tr)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; package removed from truck and placed at truck location
      (not (in-truck ?p ?tr))
      (at-pkg ?p ?loc)

      ;; advance the global stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Truck: drive between locations in the same city
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s ?s2 - time)
    :precondition (and
      (at ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; move truck location
      (not (at ?tr ?from))
      (at ?tr ?to)

      ;; advance the global stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Airplane: load package at an airport into airplane
  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location ?s ?s2 - time)
    :precondition (and
      (at ?a ?loc)
      (at-pkg ?p ?loc)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; package moved into airplane
      (not (at-pkg ?p ?loc))
      (in-plane ?p ?a)

      ;; advance the global stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Airplane: unload package from airplane at an airport
  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location ?s ?s2 - time)
    :precondition (and
      (at ?a ?loc)
      (in-plane ?p ?a)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; package removed from airplane and placed at airport location
      (not (in-plane ?p ?a))
      (at-pkg ?p ?loc)

      ;; advance the global stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Airplane: fly between airports (airplanes move between airport locations)
  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s ?s2 - time)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; move airplane from from to to
      (not (at ?a ?from))
      (at ?a ?to)

      ;; advance the global stage
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)