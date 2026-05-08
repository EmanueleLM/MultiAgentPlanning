(define (domain depots-hoist)
  (:requirements :typing :strips)
  (:types
    place surface
      depot distributor - place
      pallet crate - surface
    truck hoist
  )

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?pl - place)
    (at-hoist ?h - hoist ?pl - place)
    (at-surface ?s - surface ?pl - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)    ;; crate c is directly on surface s (pallet or crate)
    (in ?c - crate ?tr - truck)     ;; crate c is in truck tr

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; surface clearance (applies to pallets and crates)
    (clear ?s - surface)
  )

  ;; drive a truck between any two places (depots and distributors)
  (:action driver-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; move a hoist between places (keeps its holding status)
  (:action hoist-move
    :parameters (?h - hoist ?from - place ?to - place)
    :precondition (at-hoist ?h ?from)
    :effect (and
      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  ;; Preconditions:
  ;;  - hoist and the lower surface are at the same place
  ;;  - crate is directly on the lower surface
  ;;  - crate is clear (no crate on top)
  ;;  - hoist is free
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?lower - surface ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (on ?c ?lower)
      (at-surface ?lower ?pl)
      (hoist-free ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?lower))
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))
      (clear ?lower)
      ;; while held, crate is not at a surface at that place
      (not (at-surface ?c ?pl))
    )
  )

  ;; hoist drops a held crate onto a surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?lower - surface ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (hoist-holding ?h ?c)
      (at-surface ?lower ?pl)
      (clear ?lower)
    )
    :effect (and
      (on ?c ?lower)
      (not (hoist-holding ?h ?c))
      (hoist-free ?h)
      (not (clear ?lower))
      (clear ?c)
      (at-surface ?c ?pl)
    )
  )

  ;; hoist loads a held crate into a co-located truck
  ;; After loading: crate is in the truck, hoist becomes free and is not holding the crate,
  ;; and the crate is no longer at the place.
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (not (hoist-holding ?h ?c))
      (hoist-free ?h)
      (not (at-surface ?c ?pl))
    )
  )

  ;; hoist unloads a crate from a co-located truck (hoist ends up holding the crate)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (hoist-free ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (in ?c ?tr))
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))
    )
  )
)