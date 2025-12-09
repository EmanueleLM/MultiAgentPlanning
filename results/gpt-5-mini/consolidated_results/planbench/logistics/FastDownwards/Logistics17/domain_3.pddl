(define (domain logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane location city stage
  )

  (:predicates
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (in-city ?l - location ?c - city)
    (is-airport ?l - location)
    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Load a package into a truck at a location (requires package and truck at same location).
  ;; Consumes one stage and advances to its successor stage.
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?l)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Drive a truck between two locations that are in the same city.
  ;; Requires both locations belong to the same city via in-city facts.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Load a package into an airplane at an airport location.
  (:action load-plane
    :parameters (?p - package ?a - airplane ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
      (is-airport ?l)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-plane ?p ?a)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload a package from an airplane at an airport location.
  (:action unload-plane
    :parameters (?p - package ?a - airplane ?l - location ?s - stage ?s2 - stage)
    :precondition (and
      (in-plane ?p ?a)
      (at-airplane ?a ?l)
      (is-airport ?l)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?l)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Fly an airplane from one airport location to another airport location (inter-city flights).
  ;; Requires source and destination to be marked as airports.
  (:action fly
    :parameters (?a - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-airplane ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)