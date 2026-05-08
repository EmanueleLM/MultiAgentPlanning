(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    depot distributor truck hoist pallet crate
  )

  (:predicates
    ;; location: trucks, hoists, pallets, crates are at a place (depot or distributor)
    (at ?obj - (either truck hoist pallet crate) ?p - (either depot distributor))

    ;; stacking and surfaces
    (on ?c - crate ?s - (either pallet crate))
    (clear ?s - (either pallet crate))

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in_truck ?c - crate ?t - truck)

    ;; place inequality relation to avoid using (=) or :equality requirement
    (different ?p1 - (either depot distributor) ?p2 - (either depot distributor))
  )

  ;; drive a truck between any two places (depots/distributors)
  (:action drive
    :parameters (?tr - truck ?from - (either depot distributor) ?to - (either depot distributor))
    :precondition (and
      (at ?tr ?from)
      (different ?from ?to)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a supporting surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - (either depot distributor))
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; hoist drops a currently lifted crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - (either depot distributor))
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
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

  ;; hoist loads a currently lifted crate into a truck at a place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - (either depot distributor))
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

  ;; hoist unloads a crate from a truck into the hoist (crate becomes lifted)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - (either depot distributor))
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (at ?c ?p))
    )
  )
)