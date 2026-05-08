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
    (at ?o - object ?p - place)                ; objects (trucks, hoists, surfaces, crates) located at places
    (on ?c - crate ?s - surface)               ; crate is directly on a surface
    (clear ?s - surface)                       ; surface (including crates) has nothing on it
    (available ?h - hoist)                     ; hoist is free to use
    (lifting ?h - hoist ?c - crate)            ; hoist h is currently lifting crate c
    (in_truck ?c - crate ?tr - truck)          ; crate is inside a truck
  )

  ;; Drive a truck from one place to another
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

  ;; Hoist lifts a crate from a surface at a place
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

  ;; Hoist drops a crate onto a surface at a place
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

  ;; Hoist loads a crate into a truck (crate is carried by hoist prior to this)
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

  ;; Hoist unloads a crate from a truck (hoist must be available and co-located with truck)
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