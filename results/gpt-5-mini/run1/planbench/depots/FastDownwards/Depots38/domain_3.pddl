(define (domain depots_instance)
  (:requirements :strips :typing)
  (:types
    place depot distributor - place
    hoist truck
    surface pallet crate - surface
  )

  (:predicates
    ;; locations
    (at_hoist ?h - hoist ?p - place)
    (at_truck ?tr - truck ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; stacking / support
    (on ?c - crate ?s - surface)

    ;; crate inside truck
    (in_truck ?c - crate ?t - truck)

    ;; hoist state
    (hoist_available ?h - hoist)
    (hoist_lifting ?h - hoist ?c - crate)

    ;; surface (pallet or crate) has nothing on top
    (clear ?s - surface)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at_truck ?tr ?from)
    :effect (and
      (at_truck ?tr ?to)
      (not (at_truck ?tr ?from))
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (at_surface ?c ?p))
      (not (hoist_available ?h))
      (clear ?s)
      (not (on ?c ?s))
    )
  )

  ;; hoist drops a crate to a surface at a place
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at_surface ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; hoist loads a lifted crate into a truck at a place
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at_surface ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist becomes busy lifting it)
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (hoist_lifting ?h ?c)
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
    )
  )
)