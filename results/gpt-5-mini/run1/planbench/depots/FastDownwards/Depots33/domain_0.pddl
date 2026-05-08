(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate
  )

  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (clear_surface ?s - surface)
    (clear_crate ?c - crate)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)
  )

  ;; Drive a truck from one place to another place.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (at_truck ?tr ?to)
      (not (at_truck ?tr ?from))
    )
  )

  ;; Hoist lifts a crate from a pallet surface at a place.
  (:action hoist_lift_from_pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?pal ?p)
      (at_surface ?c ?p)
      (on ?c ?pal)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (clear_surface ?pal)
      (not (hoist_available ?h))
      (not (at_surface ?c ?p))
      (not (on ?c ?pal))
    )
  )

  ;; Hoist lifts a crate from another crate surface at a place.
  (:action hoist_lift_from_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (at_surface ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear_crate ?c)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (clear_surface ?s)
      (clear_crate ?s)
      (not (hoist_available ?h))
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
    )
  )

  ;; Hoist drops a crate onto a pallet surface at a place.
  (:action hoist_drop_to_pallet
    :parameters (?h - hoist ?c - crate ?pal - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?pal ?p)
      (hoist_lifting ?h ?c)
      (clear_surface ?pal)
    )
    :effect (and
      (at_surface ?c ?p)
      (on ?c ?pal)
      (clear_crate ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear_surface ?pal))
    )
  )

  ;; Hoist drops a crate onto another crate surface at a place.
  (:action hoist_drop_to_crate
    :parameters (?h - hoist ?c - crate ?s - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (hoist_lifting ?h ?c)
      (clear_crate ?s)
    )
    :effect (and
      (at_surface ?c ?p)
      (on ?c ?s)
      (clear_crate ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear_crate ?s))
      (not (clear_surface ?s)) ;; s as surface is no longer clear
    )
  )

  ;; Hoist loads a crate into a truck at a place (crate was being lifted).
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
    )
  )

  ;; Hoist unloads a crate from a truck at a place.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (not (in_truck ?c ?tr))
    )
  )

)