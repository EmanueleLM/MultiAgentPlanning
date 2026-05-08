(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    truck
    hoist
    pallet
    crate
  )

  (:predicates
    ;; things that can be located at places: trucks, hoists, pallets, crates
    (at ?x - (either truck hoist pallet crate) ?p - place)
    ;; stacking/support relation: crate on (pallet or crate)
    (on ?c - crate ?s - (either pallet crate))
    ;; whether a surface (pallet or crate) has nothing on top
    (clear ?s - (either pallet crate))
    ;; hoist availability and state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    ;; crate inside truck
    (in_truck ?c - crate ?t - truck)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; hoist lifts a crate off a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (at ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist begins lifting it)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (in_truck ?c ?t))
      (not (at ?c ?p))
    )
  )
)