(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place

    object
    physical - object
    truck hoist - physical
    surface - physical
    pallet crate - surface
  )

  (:predicates
    (at ?x - physical ?p - place)                ; physical entity is at place (trucks, hoists, pallets, crates)
    (on ?c - crate ?s - surface)                 ; crate c is directly on surface s (pallet or crate)
    (in_truck ?c - crate ?t - truck)             ; crate c is inside/on truck t
    (clear ?s - surface)                         ; surface or crate has nothing on top
    (hoist_available ?h - hoist)                 ; hoist is free
    (hoist_holding ?h - hoist ?c - crate)        ; hoist h is holding crate c
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (at ?tr ?to))
    )
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
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)
      (clear ?s)
    )
  )

  ;; hoist drops a held crate onto a clear surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (hoist_holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; hoist loads a held crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_holding ?h ?c)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (in_truck ?c ?t)
      (hoist_available ?h)
    )
  )

  ;; hoist unloads a crate from a truck (hoist at same place and available)
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
      (hoist_holding ?h ?c)
    )
  )
)