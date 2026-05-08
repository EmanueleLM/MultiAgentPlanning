(define (domain hoist-rearrange)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    support - object
    crate - support
    pallet - support
    hoist - object
    truck - object
    location
  )

  (:predicates
    (at ?o - object ?l - location)                ; object (crate/pallet/hoist/truck) is at location
    (on ?c - crate ?s - support)                 ; crate is on a support (crate or pallet)
    (clear ?s - support)                         ; a support (crate or pallet) has nothing on top
    (available ?h - hoist)                       ; hoist is free to use (not holding)
    (holding ?h - hoist ?c - crate)              ; hoist is holding a crate (or a support, treated via support type)
    (on-truck ?h - hoist ?t - truck)             ; hoist is loaded on a truck
  )

  ;; Hoist picks up a top-most crate from a support at the same location.
  (:action pick-up
    :parameters (?h - hoist ?c - crate ?s - support ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?s ?loc)
      (at ?c ?loc)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at ?c ?loc))
      (not (clear ?c))
      (clear ?s)
      (not (available ?h))
    )
  )

  ;; Hoist places a held crate onto a support (crate or pallet) at the same location.
  (:action place-on-support
    :parameters (?h - hoist ?c - crate ?t - support ?loc - location)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?loc)
      (at ?t ?loc)
      (clear ?t)
    )
    :effect (and
      (on ?c ?t)
      (at ?c ?loc)
      (clear ?c)
      (not (clear ?t))
      (not (holding ?h ?c))
      (available ?h)
    )
  )

  ;; Hoist places a held support (typically a pallet) down on the floor at the current location.
  ;; This action allows moving pallets (supports) to a location where crates can be stacked onto them.
  (:action place-on-location
    :parameters (?h - hoist ?s - support ?loc - location)
    :precondition (and
      (holding ?h ?s)
      (at ?h ?loc)
    )
    :effect (and
      (at ?s ?loc)
      (clear ?s)
      (not (holding ?h ?s))
      (available ?h)
    )
  )

  ;; Load a hoist (possibly while it is holding a support or crate) onto a truck that is at the same location.
  (:action load-hoist
    :parameters (?h - hoist ?t - truck ?loc - location)
    :precondition (and
      (at ?h ?loc)
      (at ?t ?loc)
      (available ?h)                                ; hoist must be available to be loaded (not busy with other tasks)
    )
    :effect (and
      (on-truck ?h ?t)
      (not (at ?h ?loc))
    )
  )

  ;; Unload a hoist from a truck at the truck's location.
  (:action unload-hoist
    :parameters (?h - hoist ?t - truck ?loc - location)
    :precondition (and
      (on-truck ?h ?t)
      (at ?t ?loc)
    )
    :effect (and
      (not (on-truck ?h ?t))
      (at ?h ?loc)
    )
  )

  ;; Drive a truck between locations. Hoists loaded on the truck remain on-truck during transit.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)