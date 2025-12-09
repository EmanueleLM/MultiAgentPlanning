(define (domain logistics-ns)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane package location city stage)

  (:predicates
    (truck ?t - truck)
    (plane ?p - plane)
    (package ?pkg - package)
    (location ?l - location)
    (city ?c - city)
    (stage ?s - stage)

    (airport ?l - location)
    (in-city ?l - location ?c - city)

    (at-truck ?t - truck ?l - location)
    (at-plane ?p - plane ?l - location)
    (at-pack ?pkg - package ?l - location)

    (in-truck ?pkg - package ?t - truck)
    (in-plane ?pkg - package ?p - plane)

    (current-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Load package into truck (requires package and truck co-located)
  (:action truck-load
    :parameters (?t - truck ?loc - location ?pkg - package ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?loc)
      (at-pack ?pkg ?loc)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-pack ?pkg ?loc))
      (in-truck ?pkg ?t)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload package from truck at truck location
  (:action truck-unload
    :parameters (?t - truck ?loc - location ?pkg - package ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?pkg ?t)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (in-truck ?pkg ?t))
      (at-pack ?pkg ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Drive truck between two distinct locations in the same city
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (not (at-truck ?t ?to))
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Load package into plane (only at airport)
  (:action plane-load
    :parameters (?p - plane ?loc - location ?pkg - package ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?p ?loc)
      (at-pack ?pkg ?loc)
      (airport ?loc)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-pack ?pkg ?loc))
      (in-plane ?pkg ?p)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Unload package from plane at airport
  (:action plane-unload
    :parameters (?p - plane ?loc - location ?pkg - package ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?p ?loc)
      (in-plane ?pkg ?p)
      (airport ?loc)
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (in-plane ?pkg ?p))
      (at-pack ?pkg ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  ;; Fly plane between two distinct airports in different cities
  (:action plane-fly
    :parameters (?p - plane ?from - location ?to - location ?cf - city ?ct - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?p ?from)
      (airport ?from)
      (airport ?to)
      (in-city ?from ?cf)
      (in-city ?to ?ct)
      (not (in-city ?to ?cf))
      (not (at-plane ?p ?to))
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-plane ?p ?from))
      (at-plane ?p ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)