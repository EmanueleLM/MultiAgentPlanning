(define (domain depots17)
  :requirements :strips :typing :negative-preconditions
  :types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck

  :predicates
    ; location predicates
    (at-truck ?tr - truck ?pl - place)
    (at-hoist ?h - hoist ?pl - place)
    (at-surface ?s - surface ?pl - place)

    ; stacking / containment
    (on ?c - crate ?s - surface)        ; crate c is directly on surface s
    (clear ?s - surface)               ; top of surface s is clear

    ; truck containment
    (in-truck ?c - crate ?tr - truck)

    ; hoist state
    (hoist-available ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)
  ; Actions

  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?s ?pl)
      (on ?c ?s)
      (hoist-available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at-surface ?c ?pl))
      (not (hoist-available ?h))
      (hoist-holding ?h ?c)
      (clear ?s)
    )
  )

  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?s ?pl)
      (clear ?s)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
      (on ?c ?s)
      (at-surface ?c ?pl)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (hoist-holding ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-holding ?h ?c))
      (hoist-available ?h)
    )
  )

  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?pl - place)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?tr ?pl)
      (hoist-available ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (hoist-available ?h))
      (hoist-holding ?h ?c)
    )
  )
)