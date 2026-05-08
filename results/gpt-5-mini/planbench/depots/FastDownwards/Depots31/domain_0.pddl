(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    truck
    hoist
    surface pallet crate
  )
  (:predicates
    ;; a single at predicate used for trucks, hoists, pallets, crates (places are separate types)
    (at ?x - (either truck hoist pallet crate) ?p - place)
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - (either surface crate))
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)
  )

  ;; drive a truck from one place to another (origin must differ from destination)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (at ?tr ?to)) ;; enforces origin != destination
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
      (not (at ?c ?p))         ;; crate is not at the place
      (not (on ?c ?s))         ;; crate is not on the surface
      (not (hoist_available ?h)) ;; hoist is not available
      (hoist_lifting ?h ?c)    ;; hoist is lifting the crate
      (clear ?s)               ;; surface becomes clear
      ;; note: clear ?c remains true as it was a precondition; we do not change it here
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
  ;; NOTE: The original specification provides preconditions but the effects were omitted.
  ;; Per the problem statement we do NOT invent effects. This action therefore has no effects.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and) ;; effects unspecified in the source specification
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
      (not (in_truck ?c ?t))    ;; crate is no longer in the truck
      (not (hoist_available ?h)) ;; hoist becomes not available
      (hoist_lifting ?h ?c)     ;; hoist is lifting the crate
      ;; note: the specification does not add (at ?c ?p) or (on ?c ?s) here; we preserve that omission
    )
  )
)