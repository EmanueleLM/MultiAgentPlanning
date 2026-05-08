(define (domain logistics-ns)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane package location city)

  (:predicates
    ;; type predicates (informational; instances declared in problem)
    (truck ?t - truck)
    (plane ?p - plane)
    (package ?pkg - package)
    (location ?l - location)
    (city ?c - city)

    ;; location classification
    (airport ?l - location)
    (in-city ?l - location ?c - city)

    ;; positional predicates (separate for clarity and to keep action preconditions specific by vehicle type)
    (at-truck ?t - truck ?l - location)
    (at-plane ?p - plane ?l - location)
    (at-pack ?pkg - package ?l - location)

    ;; containment
    (in-truck ?pkg - package ?t - truck)
    (in-plane ?pkg - package ?p - plane)
  )

  ;; Truck actions namespace: truck-load, truck-unload, truck-drive
  (:action truck-load
    :parameters (?t - truck ?loc - location ?pkg - package)
    :precondition (and
      (at-truck ?t ?loc)
      (at-pack ?pkg ?loc)
    )
    :effect (and
      (not (at-pack ?pkg ?loc))
      (in-truck ?pkg ?t)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?loc - location ?pkg - package)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?pkg ?t)
    )
    :effect (and
      (not (in-truck ?pkg ?t))
      (at-pack ?pkg ?loc)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      ;; disallow no-op drive to same location by ensuring truck is not already at destination
      (not (at-truck ?t ?to))
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      ;; Packages inside the truck remain in-truck (no explicit change needed)
    )
  )

  ;; Plane actions namespace: plane-load, plane-unload, plane-fly
  (:action plane-load
    :parameters (?p - plane ?loc - location ?pkg - package)
    :precondition (and
      (at-plane ?p ?loc)
      (at-pack ?pkg ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at-pack ?pkg ?loc))
      (in-plane ?pkg ?p)
    )
  )

  (:action plane-unload
    :parameters (?p - plane ?loc - location ?pkg - package)
    :precondition (and
      (at-plane ?p ?loc)
      (in-plane ?pkg ?p)
      (airport ?loc)
    )
    :effect (and
      (not (in-plane ?pkg ?p))
      (at-pack ?pkg ?loc)
    )
  )

  (:action plane-fly
    :parameters (?p - plane ?from - location ?to - location)
    :precondition (and
      (at-plane ?p ?from)
      (airport ?from)
      (airport ?to)
      ;; disallow no-op fly to same location
      (not (at-plane ?p ?to))
    )
    :effect (and
      (not (at-plane ?p ?from))
      (at-plane ?p ?to)
      ;; Packages in the plane remain in-plane (no explicit change needed)
    )
  )
)