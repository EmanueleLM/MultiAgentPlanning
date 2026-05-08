(define (domain depots-instance)
  (:requirements :strips :typing)
  (:types
    place depot distributor - place
    object truck hoist pallet crate - object
  )

  (:predicates
    ;; location of movable objects (trucks, hoists, pallets, crates)
    (at ?o - object ?p - place)

    ;; stacking: crate is on a surface (pallet or another crate)
    (on ?c - crate ?s - object)

    ;; surface or crate has nothing on top of it
    (clear ?s - object)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; crate inside a truck
    (in_truck ?c - crate ?tr - truck)
  )

  ;; drive a truck between places
  (:action drive_truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate off a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist_lifting ?h ?c)
      (at ?h ?p)
      (at ?tr ?p)
    )
    :effect (and
      (not (hoist_lifting ?h ?c))
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy holding the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (hoist_available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)