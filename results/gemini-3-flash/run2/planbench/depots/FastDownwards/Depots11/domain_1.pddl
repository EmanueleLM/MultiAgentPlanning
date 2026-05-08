(define (domain depots)
  (:requirements :typing)
  (:types 
    place truck hoist surface - object
    pallet crate - surface
  )

  (:predicates 
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear ?s - surface)
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
      (at_surface ?c ?p) 
      (available ?h) 
      (clear ?c) 
      (on ?c ?s)
    )
    :effect (and 
      (not (at_surface ?c ?p)) 
      (lifting ?h ?c) 
      (not (available ?h)) 
      (clear ?s) 
      (not (on ?c ?s))
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (at_hoist ?h ?p) 
      (at_surface ?s ?p) 
      (lifting ?h ?c) 
      (clear ?s)
    )
    :effect (and 
      (available ?h) 
      (not (lifting ?h ?c)) 
      (at_surface ?c ?p) 
      (not (clear ?s)) 
      (clear ?c) 
      (on ?c ?s)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and 
      (at_hoist ?h ?p) 
      (at_truck ?t ?p) 
      (lifting ?h ?c)
    )
    :effect (and 
      (available ?h) 
      (not (lifting ?h ?c)) 
      (in ?c ?t)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
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
    )
  )
)