(define (domain drivers-hoists-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types driver vehicle hoist item location)

  (:predicates
    (at-vehicle ?v - vehicle ?loc - location)
    (at-hoist ?h - hoist ?loc - location)
    (at-item ?i - item ?loc - location)
    (driver-at ?d - driver ?loc - location)
    (assigned ?d - driver ?v - vehicle)
    (assigned-item ?i - item ?v - vehicle)
    (destination ?i - item ?loc - location)
    (hoist-calibrated ?h - hoist)
    (hoist-available ?h - hoist)
    (hoisted ?i - item ?h - hoist)
    (loaded ?i - item ?v - vehicle)
    (loading-required ?v - vehicle)
    (delivered ?i - item)
  )

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

  (:action hoist-place-onto-vehicle-assigned
    :parameters (?h - hoist ?i - item ?v - vehicle ?loc - location)
    :precondition (and
      (hoisted ?i ?h)
      (at-hoist ?h ?loc)
      (at-vehicle ?v ?loc)
      (assigned-item ?i ?v)
    )
    :effect (and
      (not (hoisted ?i ?h))
      (hoist-available ?h)
      (loaded ?i ?v)
      (not (loading-required ?v))
    )
  )

  (:action hoist-place-onto-vehicle-unassigned
    :parameters (?h - hoist ?i - item ?v - vehicle ?loc - location)
    :precondition (and
      (hoisted ?i ?h)
      (at-hoist ?h ?loc)
      (at-vehicle ?v ?loc)
      (not (assigned-item ?i ?v))
    )
    :effect (and
      (not (hoisted ?i ?h))
      (hoist-available ?h)
      (loaded ?i ?v)
    )
  )

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