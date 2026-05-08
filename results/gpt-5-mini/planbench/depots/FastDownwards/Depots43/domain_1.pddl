(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface
    depot distributor - place
    pallet crate - surface
    truck hoist
  )

  (:predicates
    ;; location predicates
    (at_place_truck ?t - truck ?p - place)
    (at_place_hoist ?h - hoist ?p - place)
    (at_place_surface ?s - surface ?p - place)
    (at_place_crate ?c - crate ?p - place)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; truck payload
    (in_truck ?c - crate ?t - truck)

    ;; support/stacking
    (on ?c - crate ?s - surface)
    (clear_pc ?x - surface)
  )

  ;; drive action: move truck between places (no equality test to stay within :strips)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_place_truck ?tr ?from)
    )
    :effect (and
      (not (at_place_truck ?tr ?from))
      (at_place_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_place_hoist ?h ?p)
      (at_place_crate ?c ?p)
      (at_place_surface ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear_pc ?c)
    )
    :effect (and
      (not (at_place_crate ?c ?p))
      (not (on ?c ?s))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear_pc ?s)
    )
  )

  ;; hoist drops a crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_place_hoist ?h ?p)
      (at_place_surface ?s ?p)
      (hoist_lifting ?h ?c)
      (clear_pc ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at_place_crate ?c ?p)
      (not (clear_pc ?s))
      (clear_pc ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_place_hoist ?h ?p)
      (at_place_truck ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at_place_crate ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist begins lifting the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_place_hoist ?h ?p)
      (at_place_truck ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
      (not (at_place_crate ?c ?p))
    )
  )
)