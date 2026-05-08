(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface - object
    pallet crate - surface
    truck hoist - object
  )

  (:predicates
    (at ?obj - object ?p - place)            ; object (truck, hoist, pallet, crate) is at place
    (on ?crate - crate ?s - surface)         ; crate is on a surface (pallet)
    (clear ?s - surface)                     ; surface or crate is clear (no crate on it / top clear)
    (available ?h - hoist)                   ; hoist is available (not lifting)
    (lifting ?h - hoist ?c - crate)          ; hoist is currently lifting crate
    (in_truck ?tr - truck ?c - crate)        ; crate is inside truck
  )

  ;; drive a truck between any two places (precondition: truck at origin)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at ?tr ?from)
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at the same place
  (:action hoist_lift_from_surface
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

  ;; hoist drops a lifted crate to a surface at the same place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
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

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?tr ?c)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy and lifts the crate)
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?tr - truck ?c - crate ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in_truck ?tr ?c)
    )
    :effect (and
      (not (in_truck ?tr ?c))
      (not (available ?h))
      (lifting ?h ?c)
      (not (at ?c ?p))
    )
  )
)