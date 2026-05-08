(define (domain jack_of_all_trades)
  (:requirements :typing :strips)
  (:types
    place
    depot distributor - place
    object
    truck hoist - object
    surface - object
    pallet crate - surface
  )

  (:predicates
    ;; generic location for objects (trucks, hoists, surfaces, crates when not in truck)
    (at ?o - object ?p - place)

    ;; support relation: crate is directly supported by a surface (pallet or another crate)
    (on ?c - crate ?s - surface)

    ;; surface or crate has nothing on top of it
    (clear ?s - surface)

    ;; hoist availability / activity
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate is inside a truck
    (in_truck ?c - crate ?tr - truck)
  )

  ;; drive a truck between any two places (roads connect all places in this instance)
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?s)
    )
  )

  ;; hoist drops a crate to a surface at a place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (not (lifting ?h ?c))
      (available ?h)
      (in_truck ?c ?tr)
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes occupied and lifts the crate)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (not (in_truck ?c ?tr))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)