(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface
    depot distributor - place
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; location predicate for trucks, hoists, pallets, and crates
    (at ?x - (either truck hoist pallet crate) ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)

    ;; support / availability predicates
    (clear ?x - (either surface crate))
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (at ?tr ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
      (at ?c ?p)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
      (clear ?s)
    )
  )

  ;; hoist drops a crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
  )

  ;; hoist unloads a crate from a truck at a place
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)