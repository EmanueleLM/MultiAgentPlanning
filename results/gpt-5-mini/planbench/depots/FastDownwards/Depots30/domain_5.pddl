(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types
    place surface truck hoist
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; support / containment
    (on ?c - crate ?s - surface)
    (in_truck ?c - crate ?tr - truck)

    ;; hoist state
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)

    ;; surface clear (no crate on top)
    (clear ?s - surface)
  )

  ;; drive a truck between places (roads fully connected as instance states)
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_truck ?t ?from)
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; hoist lifts a crate off a supporting surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      ;; crate is no longer on the surface nor at the place while lifted
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      ;; hoist becomes busy and is lifting the crate
      (lifting ?h ?c)
      (not (available ?h))
      ;; surface becomes clear
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      ;; hoist freed
      (available ?h)
      (not (lifting ?h ?c))
      ;; crate placed at place and on surface
      (at_surface ?c ?p)
      (on ?c ?s)
      ;; surface no longer clear, crate is clear (no crate on top)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at same place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      ;; crate becomes inside truck; hoist freed and no longer lifting
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      ;; crate not at a place/surface while inside truck
      (not (at_surface ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck (hoist starts lifting it)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      ;; crate removed from truck, hoist becomes busy and lifts the crate
      (not (in_truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
      ;; crate is not yet placed on any surface (remains not at_surface)
      (not (at_surface ?c ?p))
    )
  )
)