(define (domain audited-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane vehicle package loader location)

  (:predicates
    ;; locations of vehicles and loader
    (at ?v - vehicle ?l - location)
    (loader-at ?ldr - loader ?l - location)

    ;; package placement: either at a location or carried in a vehicle
    (atpkg ?p - package ?l - location)
    (in ?p - package ?v - vehicle)

    ;; loader status and certification
    (loader-certified ?ldr - loader)
    (loader-available ?ldr - loader)

    ;; package processing states required by auditor
    (inspected ?p - package)
    (sealed ?p - package)
  )

  ;; Truck driving action (distinct from airplane)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (at ?t ?from)
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Airplane flight action (distinct)
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (at ?a ?from)
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  ;; Loader moves between locations
  (:action move-loader
    :parameters (?ldr - loader ?from - location ?to - location)
    :precondition (loader-at ?ldr ?from)
    :effect (and
      (not (loader-at ?ldr ?from))
      (loader-at ?ldr ?to)
    )
  )

  ;; Truck loads a package from the ground at same location into the truck
  (:action truck-load-from-ground
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at ?t ?loc) (atpkg ?p ?loc))
    :effect (and
      (not (atpkg ?p ?loc))
      (in ?p ?t)
    )
  )

  ;; Truck unloads a package from itself to the ground at same location
  (:action truck-unload-to-ground
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and (at ?t ?loc) (in ?p ?t))
    :effect (and
      (not (in ?p ?t))
      (atpkg ?p ?loc)
    )
  )

  ;; Inspection actions: explicit variants to enforce order and locations (no ORs)
  (:action inspect-package-at-location
    :parameters (?p - package ?loc - location)
    :precondition (and (atpkg ?p ?loc) (not (inspected ?p)))
    :effect (inspected ?p)
  )

  (:action inspect-package-in-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in ?p ?t) (at ?t ?loc) (not (inspected ?p)))
    :effect (inspected ?p)
  )

  ;; Sealing actions must follow inspection; variants for location and in-truck
  (:action seal-package-at-location
    :parameters (?p - package ?loc - location)
    :precondition (and (atpkg ?p ?loc) (inspected ?p) (not (sealed ?p)))
    :effect (sealed ?p)
  )

  (:action seal-package-in-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in ?p ?t) (at ?t ?loc) (inspected ?p) (not (sealed ?p)))
    :effect (sealed ?p)
  )

  ;; Loader loads a sealed package from a truck into an airplane (requires loader certified)
  (:action loader-load-from-truck-to-plane
    :parameters (?ldr - loader ?t - truck ?a - airplane ?p - package ?loc - location)
    :precondition (and
      (loader-at ?ldr ?loc)
      (at ?t ?loc)
      (at ?a ?loc)
      (in ?p ?t)
      (loader-certified ?ldr)
      (sealed ?p)
    )
    :effect (and
      (not (in ?p ?t))
      (in ?p ?a)
    )
  )

  ;; Loader loads a sealed package from the ground into an airplane
  (:action loader-load-from-ground-to-plane
    :parameters (?ldr - loader ?a - airplane ?p - package ?loc - location)
    :precondition (and
      (loader-at ?ldr ?loc)
      (at ?a ?loc)
      (atpkg ?p ?loc)
      (loader-certified ?ldr)
      (sealed ?p)
    )
    :effect (and
      (not (atpkg ?p ?loc))
      (in ?p ?a)
    )
  )

  ;; Loader unloads a package from airplane to ground at same location
  (:action loader-unload-plane-to-ground
    :parameters (?ldr - loader ?a - airplane ?p - package ?loc - location)
    :precondition (and
      (loader-at ?ldr ?loc)
      (at ?a ?loc)
      (in ?p ?a)
    )
    :effect (and
      (not (in ?p ?a))
      (atpkg ?p ?loc)
    )
  )

  ;; Loader unloads a package from airplane into a truck at same location
  (:action loader-unload-plane-to-truck
    :parameters (?ldr - loader ?t - truck ?a - airplane ?p - package ?loc - location)
    :precondition (and
      (loader-at ?ldr ?loc)
      (at ?t ?loc)
      (at ?a ?loc)
      (in ?p ?a)
    )
    :effect (and
      (not (in ?p ?a))
      (in ?p ?t)
    )
  )
)