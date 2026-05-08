(define (domain depots25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    crate - surface
    pallet - surface
    truck
    hoist
  )
  (:predicates
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place) ; This covers both crates and pallets
    (available ?h - hoist)
    (clear ?s - surface)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
  )

  (:action drive_truck
    :parameters (?t - truck ?p1 - place ?p2 - place)
    :precondition (and
      (at_truck ?t ?p1)
    )
    :effect (and
      (not (at_truck ?t ?p1))
      (at_truck ?t ?p2)
    )
  )

  (:action lift_crate
    :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?c ?p) ; Crate must be at the place
      (available ?h)
      (clear ?c)
      (on ?c ?s) ; Crate must be on a surface to be lifted from it
    )
    :effect (and
      (not (at_surface ?c ?p)) ; Crate is no longer directly at the place
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s) ; The surface it was on becomes clear
      (not (on ?c ?s))
    )
  )

  (:action drop_crate
    :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p) ; Target surface must be at the place
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at_surface ?c ?p) ; Crate is now directly at the place
      (not (clear ?s)) ; Target surface is no longer clear
      (clear ?c) ; Crate becomes clear as it's now on top
      (on ?c ?s)
    )
  )

  (:action load_crate
    :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
      (not (in ?c ?t)) ; Crate must not already be in the truck
    )
    :effect (and
      (in ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
      (not (at_surface ?c ?p)) ; Crate is no longer directly at the place once loaded into truck
    )
  )

  (:action unload_crate
    :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
      (not (at_surface ?c ?p)) ; When lifted from truck, it's no longer directly at the place
    )
  )