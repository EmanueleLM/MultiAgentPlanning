(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types crate pallet location hoist truck)

  (:predicates
    ;; location predicates
    (at-crate ?c - crate ?l - location)
    (at-pallet ?p - pallet ?l - location)
    (at-hoist ?h - hoist ?l - location)
    (at-truck ?tr - truck ?l - location)

    ;; containment / carrying
    (on ?c - crate ?p - pallet)       ;; crate c is on pallet p
    (on-truck ?c - crate)             ;; crate is on truck

    ;; hoist state
    (holding ?h - hoist ?c - crate)   ;; hoist h is holding crate c
    (hoist-free ?h - hoist)           ;; hoist h is not holding anything

    ;; pallet capacity constraint: true iff pallet currently has no crate
    (pallet-empty ?p - pallet)
  )

  ;; Hoist moves itself between locations. Hoist must be free to move.
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and (hoist-free ?h) (at-hoist ?h ?from))
    :effect (and
      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)
    )
  )

  ;; Hoist picks a crate from the floor (crate at same location).
  (:action hoist-pick-from-floor
    :parameters (?h - hoist ?c - crate ?l - location)
    :precondition (and (hoist-free ?h) (at-hoist ?h ?l) (at-crate ?c ?l))
    :effect (and
      (not (at-crate ?c ?l))
      (holding ?h ?c)
      (not (hoist-free ?h))
    )
  )

  ;; Hoist picks a crate from a pallet. Picking makes the pallet empty.
  (:action hoist-pick-from-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?l - location)
    :precondition (and (hoist-free ?h) (at-hoist ?h ?l) (at-pallet ?p ?l) (on ?c ?p))
    :effect (and
      (not (on ?c ?p))
      (holding ?h ?c)
      (not (hoist-free ?h))
      (pallet-empty ?p)
    )
  )

  ;; Hoist places a held crate onto an empty pallet at the same location.
  ;; Enforces the one-crate-per-pallet constraint by requiring pallet-empty.
  (:action hoist-place-on-pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?l - location)
    :precondition (and (holding ?h ?c) (at-hoist ?h ?l) (at-pallet ?p ?l) (pallet-empty ?p))
    :effect (and
      (not (holding ?h ?c))
      (on ?c ?p)
      (hoist-free ?h)
      (not (pallet-empty ?p))
    )
  )

  ;; Hoist places a held crate onto the truck (truck must be at same location).
  (:action hoist-load-to-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?l - location)
    :precondition (and (holding ?h ?c) (at-hoist ?h ?l) (at-truck ?tr ?l))
    :effect (and
      (not (holding ?h ?c))
      (on-truck ?c)
      (hoist-free ?h)
    )
  )

  ;; Hoist picks a crate from the truck (truck and hoist same location).
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?l - location)
    :precondition (and (hoist-free ?h) (at-hoist ?h ?l) (at-truck ?tr ?l) (on-truck ?c))
    :effect (and
      (holding ?h ?c)
      (not (on-truck ?c))
      (not (hoist-free ?h))
    )
  )

  ;; Truck drives between locations. No loading/unloading semantics in truck actions;
  ;; all loading/unloading is performed by the hoist to enforce agent separation.
  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )
)