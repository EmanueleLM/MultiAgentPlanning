(define (domain transport-domain)
  ;; Domain for moving packages using trucks and airplanes.
  ;; Requirements limited to commonly supported features for FastDownwards.
  (:requirements :strips :typing :negative-preconditions)

  (:types package vehicle location)

  (:predicates
    ;; Type/class markers (auditor-recommended explicit classifiers)
    (truck ?v - vehicle)        ; identifies a vehicle as a truck
    (airplane ?v - vehicle)     ; identifies a vehicle as an airplane

    ;; Basic world state
    (location ?l - location)

    ;; Package location and containment
    (at ?p - package ?l - location)        ; package p is at location l
    (in ?p - package ?v - vehicle)         ; package p is inside vehicle v

    ;; Vehicle location
    (vehicle-at ?v - vehicle ?l - location)

    ;; Airport marker for locations where airplanes may operate
    (airport ?l - location)
  )

  ;; -------------------------
  ;; Truck actions
  ;; -------------------------

  ;;; Load a package into a truck (truck must be at same location).
  (:action truck-load
    :parameters (?t - vehicle ?p - package ?loc - location)
    :precondition (and
      (truck ?t)
      (vehicle-at ?t ?loc)
      (at ?p ?loc)
      ;; Ensure package is not already recorded inside this truck.
      ;; (We rely on the initial state to ensure packages are not in any vehicle.)
      (not (in ?p ?t))
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?loc))
    )
  )

  ;;; Unload a package from a truck to the truck's current location.
  (:action truck-unload
    :parameters (?t - vehicle ?p - package ?loc - location)
    :precondition (and
      (truck ?t)
      (vehicle-at ?t ?loc)
      (in ?p ?t)
    )
    :effect (and
      (at ?p ?loc)
      (not (in ?p ?t))
    )
  )

  ;;; Drive a truck from one location to another.
  ;;  No explicit connectivity graph is assumed beyond the declared locations.
  (:action truck-drive
    :parameters (?t - vehicle ?from - location ?to - location)
    :precondition (and
      (truck ?t)
      (vehicle-at ?t ?from)
      ;; Prevent no-op moves to the same location
      (not (vehicle-at ?t ?to))
    )
    :effect (and
      (vehicle-at ?t ?to)
      (not (vehicle-at ?t ?from))
    )
  )

  ;; -------------------------
  ;; Airplane actions
  ;; -------------------------

  ;;; Load a package into an airplane at an airport location.
  (:action plane-load
    :parameters (?a - vehicle ?p - package ?loc - location)
    :precondition (and
      (airplane ?a)
      (airport ?loc)
      (vehicle-at ?a ?loc)
      (at ?p ?loc)
      (not (in ?p ?a))
    )
    :effect (and
      (in ?p ?a)
      (not (at ?p ?loc))
    )
  )

  ;;; Unload a package from an airplane at an airport location.
  (:action plane-unload
    :parameters (?a - vehicle ?p - package ?loc - location)
    :precondition (and
      (airplane ?a)
      (airport ?loc)
      (vehicle-at ?a ?loc)
      (in ?p ?a)
    )
    :effect (and
      (at ?p ?loc)
      (not (in ?p ?a))
    )
  )

  ;;; Fly an airplane between two airport locations.
  (:action plane-fly
    :parameters (?a - vehicle ?from - location ?to - location)
    :precondition (and
      (airplane ?a)
      (airport ?from)
      (airport ?to)
      (vehicle-at ?a ?from)
      ;; Prevent no-op flight
      (not (vehicle-at ?a ?to))
    )
    :effect (and
      (vehicle-at ?a ?to)
      (not (vehicle-at ?a ?from))
    )
  )

)