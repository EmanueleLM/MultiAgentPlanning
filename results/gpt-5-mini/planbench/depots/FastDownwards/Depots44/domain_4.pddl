(define (domain jack_of_all_trades)
  (:requirements :typing :strips)
  (:types
    place
    depot distributor - place

    thing
    surface - thing
    crate pallet - surface
    truck hoist - thing
  )

  (:predicates
    ;; location of things (trucks, hoists, pallets, crates)
    (at ?x - thing ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate inside truck
    (in_truck ?c - crate ?tr - truck)

    ;; stacking / support relation: crate on a surface (surface may be a pallet or another crate)
    (on ?c - crate ?s - surface)

    ;; clear marker for any surface (pallet or crate)
    (clear ?s - surface)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )

  ;; lift a crate from a surface at a place using a hoist
  ;; Pre: hoist, crate and surface are at same place, hoist available, crate clear, crate on that surface
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (at ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
    )
  )

  ;; drop a crate to a surface at a place using a hoist
  ;; Pre: hoist and surface at same place, surface clear, hoist lifting the crate
  (:action drop
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
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; load a crate into a truck at a place using a hoist
  ;; Pre: hoist and truck at same place and hoist is lifting the crate
  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; unload a crate from a truck at a place using a hoist
  ;; Pre: hoist and truck at same place, hoist available, crate is in the truck
  (:action unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in_truck ?c ?tr)
    )
    :effect (and
      (lifting ?h ?c)
      (not (in_truck ?c ?tr))
      (not (available ?h))
    )
  )
)