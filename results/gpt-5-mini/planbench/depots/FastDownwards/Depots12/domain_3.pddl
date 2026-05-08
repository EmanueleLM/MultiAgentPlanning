(define (domain depots12)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck hoist
  )

  (:predicates
    ;; positions
    (at_truck ?t - truck ?p - place)
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

    ;; connectivity for driving
    (connected ?from - place ?to - place)
  )

  ;; drive truck between places
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

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at_surface ?c ?p))
      (lifting ?h ?c)
      (not (hoist_available ?h))
      ;; surface below becomes clear after removing the crate
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
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

  ;; hoist loads a lifted crate into a truck at the same place
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
      (not (at_surface ?c ?p))
      (clear ?c)
    )
  )

  ;; hoist unloads a crate from a truck (hoist begins lifting the crate) at the same place
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
      ;; crate lifted out of truck is not at any surface at the place
      (not (at_surface ?c ?p))
    )
  )
)