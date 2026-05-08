(define (domain logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane location
    loc0 loc1 - location
    airport0 - loc0
    airport1 - loc1
  )

  (:predicates
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
  )

  ;; Load/unload to/from trucks (same for all locations)
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?l)
    )
  )

  ;; Driving is permitted only within the same city.
  ;; We encode city-membership via location subtypes (loc0 / loc1),
  ;; so separate drive actions per city subtype avoid listing in-city facts.
  (:action drive-loc0
    :parameters (?t - truck ?from - loc0 ?to - loc0)
    :precondition (and
      (at-truck ?t ?from)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  (:action drive-loc1
    :parameters (?t - truck ?from - loc1 ?to - loc1)
    :precondition (and
      (at-truck ?t ?from)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Loading/unloading airplanes at airport locations encoded by airport0/airport1 types.
  (:action load-plane-0
    :parameters (?p - package ?a - airplane ?l - airport0)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-plane ?p ?a)
    )
  )

  (:action load-plane-1
    :parameters (?p - package ?a - airplane ?l - airport1)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-plane ?p ?a)
    )
  )

  (:action unload-plane-0
    :parameters (?p - package ?a - airplane ?l - airport0)
    :precondition (and
      (in-plane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?l)
    )
  )

  (:action unload-plane-1
    :parameters (?p - package ?a - airplane ?l - airport1)
    :precondition (and
      (in-plane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?l)
    )
  )

  ;; Flights between the two city airports are encoded explicitly as actions
  ;; between the corresponding airport subtypes. This avoids listing airport
  ;; or in-city facts in the initial state.
  (:action fly-0-to-1
    :parameters (?a - airplane ?from - airport0 ?to - airport1)
    :precondition (and
      (at-airplane ?a ?from)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )

  (:action fly-1-to-0
    :parameters (?a - airplane ?from - airport1 ?to - airport0)
    :precondition (and
      (at-airplane ?a ?from)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)