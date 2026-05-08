(define (domain depots25)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; roads (symmetric in the instance)
    (road-connected ?from - place ?to - place)

    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    ;; location for surfaces (pallets and crates)
    (at ?s - surface ?p - place)

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
      (at ?s ?p)
      (on ?c ?s)
      (hoist-free ?h)
      (clear ?c)
    )
    :effect (and
      ;; hoist picks up the crate
      (hoist-holding ?h ?c)
      (not (hoist-free ?h))

      ;; crate removed from support and from place
      (not (on ?c ?s))
      (not (at ?c ?p))

      ;; surface becomes clear after removal
      (clear ?s)
      ;; lifted crate is top-of-stack with nothing on it
      (clear ?c)
    )
  )

  ;; hoist drops the crate it is holding onto a clear surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-holding ?h ?c)
      (at-hoist ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist-holding ?h ?c))
      (hoist-free ?h)

      (on ?c ?s)
      (at ?c ?p)

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

      ;; crate is no longer at the place (it's inside the truck)
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a co-located truck (hoist must be free)
  ;; after unload the hoist will be holding the crate (crate not yet placed on any surface)
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
      ;; crate is held by hoist and not at the place until dropped
      (not (at ?c ?p))
    )
  )
)