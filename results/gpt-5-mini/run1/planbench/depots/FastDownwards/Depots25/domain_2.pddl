(define (domain depots25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    depot distributor - place
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; connectivity between places (roads are symmetric in the problem init)
    (road-connected ?from - place ?to - place)

    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at ?c - crate ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking: crate on a surface (surface = pallet or crate)
    (on ?c - crate ?s - surface)

    ;; clear/top-of-stack for surfaces (pallets and crates)
    (clear ?s - surface)

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-holding ?h - hoist ?c - crate)

    ;; crate inside truck
    (in-truck ?c - crate ?tr - truck)
  )

  ;; drive a truck between road-connected places
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (road-connected ?from ?to)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; hoist lifts a clear crate from a supporting surface at the same place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at ?c ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (hoist-free ?h)
      (clear ?c)
    )
    :effect (and
      ;; hoist picks up the crate
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))

      ;; crate removed from support and place
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (at-surface ?c ?p))

      ;; surface becomes clear (crate was removed)
      (clear ?s)
      ;; crate remains top (nothing on it)
      (clear ?c)
    )
  )

  ;; hoist drops the crate it is holding onto a clear surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-holding ?h ?c)
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (hoist-free ?h)

      (on ?c ?s)
      (at ?c ?p)
      (at-surface ?c ?p)

      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads the crate it holds into a co-located truck
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-holding ?h ?c)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
    )
    :effect (and
      (in-truck ?c ?tr)

      (not (hoist-holding ?h ?c))
      (hoist-free ?h)

      (not (at ?c ?p))
      (not (at-surface ?c ?p))
      ;; crate in truck is not on any surface; it is not clear as a surface (it's an item)
    )
  )

  ;; hoist unloads a crate from a co-located truck (hoist must be free)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))

      (not (at ?c ?p))
      (not (at-surface ?c ?p))
    )
  )
)