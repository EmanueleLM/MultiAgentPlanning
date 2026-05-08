(define (domain depots_instance)
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
    ;; explicit location predicates
    (at_truck ?tr - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_pallet ?s - pallet ?p - place)
    (at_crate ?c - crate ?p - place)

    ;; support / containment relations
    (on ?c - crate ?s - pallet)
    (in_truck ?c - crate ?tr - truck)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; clear applies to any surface (pallet or crate)
    (clear ?s - surface)
  )

  ;; drive a truck between places (roads fully connected per problem statement)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a pallet at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
      (not (at_crate ?c ?p))
    )
  )

  ;; hoist drops a crate onto a pallet at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - pallet ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_pallet ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (at_crate ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
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
      (not (at_crate ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck and starts lifting it
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
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
    )
  )
)