(define (domain depots-instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking: crate is on a surface (pallet or another crate)
    (on ?c - crate ?s - surface)

    ;; surface or crate has nothing on top of it
    (clear ?s - surface)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; crate inside a truck
    (in_truck ?c - crate ?tr - truck)
  )

  ;; drive a truck between places (roads connect any two places)
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate off a surface at a place
  ;; requires hoist at the place, surface at the place, crate on that surface, hoist available, crate clear
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate removed from its supporting surface and removed from being at the place as a surface object
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      ;; hoist becomes busy holding crate
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      ;; the support becomes clear
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at_surface ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?tr)
      ;; crate is no longer at the place as a surface object
      (not (at_surface ?c ?p))
      ;; crate now has nothing on it (it is inside truck)
      (clear ?c)
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy holding the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)