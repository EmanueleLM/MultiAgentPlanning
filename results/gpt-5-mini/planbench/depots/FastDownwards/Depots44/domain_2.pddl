(define (domain jack_of_all_trades)
  (:requirements :typing :negative-preconditions :strips)
  (:types
    obj
    place
    depot distributor - place
    truck hoist - obj
    surface - obj
    crate pallet - surface
  )

  (:predicates
    ;; location of trucks, hoists, pallets, crates (all non-place objects are subtypes of obj)
    (at ?x - obj ?p - place)

    ;; hoist state
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)

    ;; crate inside truck
    (in ?c - crate ?tr - truck)

    ;; stacking / support relation: crate on a surface (surface may be a pallet or another crate)
    (on ?c - crate ?s - surface)

    ;; clear markers
    (clear_surface ?s - surface)
    (clear_crate ?c - crate)
  )

  ;; drive a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (at ?tr ?to))
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )

  ;; lift a crate from a surface at a place using a hoist
  ;; Pre: hoist and surface and crate are at same place, hoist available, crate clear, crate on that surface
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (available ?h)
      (clear_crate ?c)
      (on ?c ?s)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (clear_surface ?s)
      (not (at ?c ?p))
      (not (on ?c ?s))
    )
  )

  ;; drop a crate to a surface at a place using a hoist
  ;; Pre: hoist and surface at same place, surface clear, hoist lifting the crate
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear_surface ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (on ?c ?s)
      (clear_crate ?c)
      (not (clear_surface ?s))
    )
  )

  ;; load a crate into a truck at a place using a hoist
  ;; Pre: hoist and truck at same place and hoist is lifting the crate
  ;; Effect: crate becomes inside the truck, hoist becomes available, hoist stops lifting, crate no longer at place
  (:action load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; unload a crate from a truck at a place using a hoist
  ;; Pre: hoist and truck at same place, hoist available, crate is in the truck
  ;; Effect: hoist lifts the crate and becomes unavailable, crate no longer in truck
  (:action unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (lifting ?h ?c)
      (not (in ?c ?tr))
      (not (available ?h))
    )
  )
)