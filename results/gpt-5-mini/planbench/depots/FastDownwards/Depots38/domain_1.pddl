(define (domain jack_of_all_trades_instance)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    place
    depot distributor - place
    object
    surface - object
    pallet crate - surface
    truck hoist - object
  )

  (:predicates
    (at ?o - object ?p - place)                ; object (truck, hoist, surface) is at place
    (on ?c - crate ?s - surface)               ; crate is on a surface (pallet or another crate)
    (in_truck ?c - crate ?t - truck)           ; crate is inside a truck
    (clear ?s - surface)                       ; surface (crate or pallet) has nothing on it
    (hoist_available ?h - hoist)               ; hoist is free to use
    (hoist_lifting ?h - hoist ?c - crate)      ; hoist is currently lifting this crate
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist_available ?h)
    )
    :effect (and
      (not (at ?c ?p))         ; crate no longer considered at the place while lifted
      (hoist_lifting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)               ; surface becomes clear after lifting
      (not (on ?c ?s))
    )
  )

  ;; hoist drops a lifted crate to a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (hoist_available ?h)
      (not (hoist_lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck: hoist becomes busy and holds the crate
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
      (hoist_lifting ?h ?c)
    )
  )
)