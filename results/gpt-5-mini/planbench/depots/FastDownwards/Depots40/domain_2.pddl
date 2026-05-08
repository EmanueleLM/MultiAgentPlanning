(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place surface truck hoist
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (truck_at ?tr - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (surface_at ?s - surface ?p - place)

    ;; support and containment
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)

    ;; resources / state
    (hoist_available ?h - hoist)
    (clear ?s - surface)
  )

  ;; drive a truck between places (roads exist between any two places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?tr ?from)
    )
    :effect (and
      (not (truck_at ?tr ?from))
      (truck_at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at the same place
  ;; negative preconditions prevent lifting a crate that is inside any truck or already lifted by any hoist
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)

      ;; crate must not be inside any truck (explicit for this instance: 3 trucks)
      (not (in_truck ?c truck0))
      (not (in_truck ?c truck1))
      (not (in_truck ?c truck2))

      ;; crate must not already be lifted by any hoist (explicit for this instance: 4 hoists)
      (not (lifting hoist0 ?c))
      (not (lifting hoist1 ?c))
      (not (lifting hoist2 ?c))
      (not (lifting hoist3 ?c))
    )
    :effect (and
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      ;; crate is no longer located at the place as a surface (if it was asserted)
      (not (surface_at ?c ?p))
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (surface_at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (on ?c ?s)
      (surface_at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?t)
      ;; crate is no longer at the place as a surface while inside truck
      (not (surface_at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes occupied lifting the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (lifting ?h ?c)
    )
  )
)