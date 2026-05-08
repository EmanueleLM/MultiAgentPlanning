(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types 
    place
    truck
    hoist
    surface
    crate - surface
    pallet - surface
  )

  (:predicates 
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_crate ?c - crate ?p - place)
    (on_crate ?c1 - crate ?s - surface)
    (in_truck ?c - crate ?t - truck)
    (clear ?s - surface)
    (hoist_available ?h - hoist)
    (hoisting ?h - hoist ?c - crate)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_truck ?t ?from)
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (at_hoist ?h ?p) 
      (at_crate ?c ?p) 
      (hoist_available ?h) 
      (clear ?c) 
      (on_crate ?c ?s))
    :effect (and
      (not (at_crate ?c ?p))
      (hoisting ?h ?c)
      (not (hoist_available ?h))
      (clear ?s)
      (not (on_crate ?c ?s))
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (at_hoist ?h ?p) 
      (hoisting ?h ?c) 
      (at_surface ?s ?p) 
      (clear ?s))
    :effect (and
      (hoist_available ?h)
      (not (hoisting ?h ?c))
      (at_crate ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on_crate ?c ?s)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and 
      (at_hoist ?h ?p) 
      (at_truck ?t ?p) 
      (hoisting ?h ?c))
    :effect (and
      (not (hoisting ?h ?c))
      (in_truck ?c ?t)
      (hoist_available ?h)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and 
      (at_hoist ?h ?p) 
      (at_truck ?t ?p) 
      (hoist_available ?h) 
      (in_truck ?c ?t))
    :effect (and
      (not (in_truck ?c ?t))
      (hoisting ?h ?c)
      (not (hoist_available ?h))
    )
  )
)