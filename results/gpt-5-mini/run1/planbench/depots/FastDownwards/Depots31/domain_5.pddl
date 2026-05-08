(define (domain depots_sem)
  (:requirements :strips :typing)
  (:types
    place
      depot distributor - place
    object
      truck hoist surface - object
    surface
      pallet crate - surface
  )

  (:predicates
    ;; location of any object (trucks, hoists, surfaces, crates)
    (at ?o - object ?p - place)

    ;; stacking / support relation: crate on a surface (pallet or another crate)
    (on ?c - crate ?s - surface)

    ;; crate inside a truck
    (in_truck ?c - crate ?t - truck)

    ;; hoist availability and lifting relation
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; surface (pallet or crate) has nothing on top of it
    (clear ?s - surface)
  )

  ;; drive a truck between places (roads exist between any places in this instance;
  ;; connectivity is not modeled as predicates — the planner may drive from any place to any place
  ;; but the action requires the truck to actually be at the origin).
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; lift a crate from a surface at a place with a hoist
  (:action lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
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

  ;; drop a lifted crate to a surface at the same place
  (:action drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
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

  ;; load a lifted crate into a truck at a place
  (:action load_to_truck
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

  ;; unload a crate from a truck using an available hoist at the truck's place;
  ;; after unloading the hoist becomes busy (lifting the crate).
  (:action unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
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