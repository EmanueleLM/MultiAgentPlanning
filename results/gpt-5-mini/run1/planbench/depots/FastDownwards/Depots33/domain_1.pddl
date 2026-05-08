(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    truck
    hoist
    surface
    pallet crate - surface
  )

  (:predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)  ;; a surface (pallet or crate) is at a place
    (on ?c - crate ?s - surface)          ;; crate c is directly on surface s
    (clear ?s - surface)                  ;; the top of surface s is clear (nothing on it)
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
    (in_truck ?c - crate ?tr - truck)
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

  ;; Hoist lifts a crate from a surface (pallet or crate) at a place.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (at_surface ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)                ;; nothing on top of the crate being lifted
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
      (clear ?s)                ;; the supporting surface becomes clear
    )
  )

  ;; Hoist drops a crate onto a surface (pallet or crate) at a place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (hoist_lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (at_surface ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; Hoist loads a (lifted) crate into a truck at a place.
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

  ;; Hoist unloads a crate from a truck at a place (placing it in the hoist).
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