(define (domain drivers-hoists-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types driver vehicle hoist item location)

  (:predicates
    ;; Locations
    (at-vehicle ?v - vehicle ?loc - location)
    (at-hoist ?h - hoist ?loc - location)
    (at-item ?i - item ?loc - location)
    (driver-at ?d - driver ?loc - location)

    ;; Assignments / destinations
    (assigned ?d - driver ?v - vehicle)
    (assigned-item ?i - item ?v - vehicle)
    (destination ?i - item ?loc - location)

    ;; Hoist state
    (hoist-calibrated ?h - hoist)
    (hoist-available ?h - hoist)
    (hoisted ?i - item ?h - hoist)

    ;; Vehicle load state
    (loaded ?i - item ?v - vehicle)
    (loading-required ?v - vehicle)

    ;; Delivery completion
    (delivered ?i - item)
  )

  ;; DRIVER actions: driving vehicles; drivers must be assigned to vehicle and vehicles
  ;; must have completed their loading step before departing (enforced by loading-required).
  (:action drive
    :parameters (?d - driver ?v - vehicle ?from - location ?to - location)
    :precondition (and
      (assigned ?d ?v)
      (driver-at ?d ?from)
      (at-vehicle ?v ?from)
      (not (loading-required ?v))
    )
    :effect (and
      (not (driver-at ?d ?from))
      (not (at-vehicle ?v ?from))
      (driver-at ?d ?to)
      (at-vehicle ?v ?to)
    )
  )

  ;; HOIST actions: calibration, pick up items from ground, place onto vehicle, unload from vehicle,
  ;; and place onto ground. Calibration required before any pick.
  (:action calibrate-hoist
    :parameters (?h - hoist ?loc - location)
    :precondition (and
      (at-hoist ?h ?loc)
      (not (hoist-calibrated ?h))
    )
    :effect (hoist-calibrated ?h)
  )

  (:action hoist-pick-from-ground
    :parameters (?h - hoist ?i - item ?loc - location)
    :precondition (and
      (at-hoist ?h ?loc)
      (at-item ?i ?loc)
      (hoist-calibrated ?h)
      (hoist-available ?h)
    )
    :effect (and
      (not (at-item ?i ?loc))
      (not (hoist-available ?h))
      (hoisted ?i ?h)
    )
  )

  ;; Place an item currently hoisted onto a vehicle at the same location.
  ;; If the item is assigned to that vehicle and loading is required, loading-required is cleared.
  (:action hoist-place-onto-vehicle
    :parameters (?h - hoist ?i - item ?v - vehicle ?loc - location)
    :precondition (and
      (hoisted ?i ?h)
      (at-hoist ?h ?loc)
      (at-vehicle ?v ?loc)
    )
    :effect (and
      (not (hoisted ?i ?h))
      (hoist-available ?h)
      (loaded ?i ?v)
      ;; If this item is assigned to this vehicle, assume this satisfies loading for the vehicle.
      ;; This enforces that drive cannot happen until assigned items are loaded.
      (when (assigned-item ?i ?v)
        (not (loading-required ?v))
      )
    )
  )

  ;; Unload item from vehicle using hoist: pick from vehicle into hoist (hoist becomes unavailable).
  (:action hoist-unload-from-vehicle
    :parameters (?h - hoist ?i - item ?v - vehicle ?loc - location)
    :precondition (and
      (loaded ?i ?v)
      (at-vehicle ?v ?loc)
      (at-hoist ?h ?loc)
      (hoist-calibrated ?h)
      (hoist-available ?h)
    )
    :effect (and
      (not (loaded ?i ?v))
      (not (hoist-available ?h))
      (hoisted ?i ?h)
    )
  )

  ;; Place hoisted item onto the ground at the hoist location when that location is the item's destination.
  (:action hoist-place-to-ground-at-destination
    :parameters (?h - hoist ?i - item ?loc - location)
    :precondition (and
      (hoisted ?i ?h)
      (at-hoist ?h ?loc)
      (destination ?i ?loc)
    )
    :effect (and
      (not (hoisted ?i ?h))
      (hoist-available ?h)
      (at-item ?i ?loc)
      (delivered ?i)
    )
  )

  ;; Place hoisted item onto the ground at the hoist location when that location is NOT the item's destination.
  (:action hoist-place-to-ground-not-destination
    :parameters (?h - hoist ?i - item ?loc - location)
    :precondition (and
      (hoisted ?i ?h)
      (at-hoist ?h ?loc)
      (not (destination ?i ?loc))
    )
    :effect (and
      (not (hoisted ?i ?h))
      (hoist-available ?h)
      (at-item ?i ?loc)
    )
  )
)