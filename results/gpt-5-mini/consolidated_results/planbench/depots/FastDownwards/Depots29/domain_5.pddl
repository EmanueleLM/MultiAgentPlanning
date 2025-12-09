(define (domain depots-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place truck hoist phase surface pallet crate - surface
  )

  (:predicates
    ;; locations
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)
    (at-crate ?c - crate ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate in truck
    (in-truck ?c - crate ?t - truck)

    ;; stacking/on relation: crates and pallets are surfaces
    (on ?c - crate ?s - surface)

    ;; clear means nothing is on that surface (applies to pallets and crates)
    (clear ?s - surface)

    ;; discrete phase attached to each crate and successor relation
    (at-phase ?c - crate ?ph - phase)
    (next ?ph1 - phase ?ph2 - phase)

    ;; target pallet assignment (goal destinations)
    (target-pallet ?c - crate ?p - pallet)
  )

  ;; drive: move a truck between places (crates in-truck remain in-truck)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?srf - surface ?pl - place ?ph1 - phase ?ph2 - phase)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?srf ?pl)
      (on ?c ?srf)
      (at-crate ?c ?pl)
      (clear ?c)
      (available ?h)
      (at-phase ?c ?ph1)
      (next ?ph1 ?ph2)
    )
    :effect (and
      ;; crate removed from surface and place; hoist becomes busy and lifts crate
      (not (on ?c ?srf))
      (not (at-crate ?c ?pl))
      (not (available ?h))
      (lifting ?h ?c)

      ;; surface becomes clear after lift
      (clear ?srf)

      ;; phase advances for the crate (enforce contiguous progression)
      (not (at-phase ?c ?ph1))
      (at-phase ?c ?ph2)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?srf - surface ?pl - place ?ph1 - phase ?ph2 - phase)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-surface ?srf ?pl)
      (clear ?srf)
      (lifting ?h ?c)
      (at-phase ?c ?ph1)
      (next ?ph1 ?ph2)
    )
    :effect (and
      ;; hoist becomes available and no longer lifts the crate
      (available ?h)
      (not (lifting ?h ?c))

      ;; crate placed on surface and located at place
      (on ?c ?srf)
      (at-crate ?c ?pl)

      ;; surface now occupied; the crate is clear (nothing on it)
      (not (clear ?srf))
      (clear ?c)

      ;; phase advances
      (not (at-phase ?c ?ph1))
      (at-phase ?c ?ph2)
    )
  )

  ;; hoist loads a lifted crate into a co-located truck
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?t - truck ?c - crate ?pl - place ?ph1 - phase ?ph2 - phase)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
      (lifting ?h ?c)
      (at-phase ?c ?ph1)
      (next ?ph1 ?ph2)
    )
    :effect (and
      ;; crate becomes inside the truck; hoist released
      (in-truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))

      ;; crate is not at the place while inside truck
      (not (at-crate ?c ?pl))

      ;; phase advances
      (not (at-phase ?c ?ph1))
      (at-phase ?c ?ph2)
    )
  )

  ;; hoist unloads a crate from a truck (hoist must be available and co-located with truck)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?t - truck ?c - crate ?pl - place ?ph1 - phase ?ph2 - phase)
    :precondition (and
      (at-hoist ?h ?pl)
      (at-truck ?t ?pl)
      (available ?h)
      (in-truck ?c ?t)
      (at-phase ?c ?ph1)
      (next ?ph1 ?ph2)
    )
    :effect (and
      ;; crate removed from truck and hoist becomes busy lifting it
      (not (in-truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)

      ;; crate is not yet at the place while being lifted
      (not (at-crate ?c ?pl))

      ;; phase advances
      (not (at-phase ?c ?ph1))
      (at-phase ?c ?ph2)
    )
  )
)