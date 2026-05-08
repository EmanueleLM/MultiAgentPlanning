(define (domain depots12)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; positions
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)
    (in ?c - crate ?tr - truck)

    ;; hoist status
    (lifting ?h - hoist ?c - crate)
    (hoist_available ?h - hoist)

    ;; surface/crate clear (surface includes pallet and crate)
    (clear ?s - surface)

    ;; connectivity for driving (encoded by explicit facts in the problem)
    (connected ?from - place ?to - place)
  )

  ;; Truck driving action (truck planner)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at_truck ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Hoist lifts a crate from a surface at a place (hoist planner)
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (at_surface ?c ?p)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  ;; Hoist drops a currently lifted crate to a surface at a place (hoist planner)
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (on ?c ?s)
      (at_surface ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a currently lifted crate into a truck at the same place (hoist planner)
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (hoist_available ?h)
      (in ?c ?tr)
      ;; crate is no longer at a surface/place while in the truck
      (not (at_surface ?c ?p))
      (clear ?c)
    )
  )

  ;; Hoist begins unloading a crate from a truck (hoist starts lifting the crate out of the truck)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?tr - truck ?c - crate ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?tr ?p)
      (hoist_available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (in ?c ?tr))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      ;; crate is being lifted and therefore not recorded as at a surface
      (not (at_surface ?c ?p))
    )
  )
)