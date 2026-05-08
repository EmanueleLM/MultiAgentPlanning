(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    place 
    surface 
    depot - place
    distributor - place
    pallet - surface
    crate - surface
    truck
    hoist
  )
  (:predicates
    (at ?o - (either truck hoist crate) ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
    (road_connected ?from - place ?to - place)
  )
  
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
      (road_connected ?from ?to)
    )
    :effect (and 
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
  
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (at ?h ?p) 
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and 
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )
  
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and 
      (lifting ?h ?c) 
      (at ?h ?p) 
      (clear ?s)
    )
    :effect (and 
      (on ?c ?s) 
      (clear ?c)
      (not (lifting ?h ?c))
      (available ?h)
      (not (clear ?s))
    )
  )
  
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and 
      (lifting ?h ?c) 
      (at ?h ?p) 
      (at ?t ?p)
    )
    :effect (and 
      (in ?c ?t)
      (not (lifting ?h ?c))
      (available ?h)
    )
  )
  
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and 
      (in ?c ?t) 
      (at ?h ?p) 
      (at ?t ?p) 
      (available ?h)
    )
    :effect (and 
      (at ?c ?p)
      (lifting ?h ?c)
      (not (in ?c ?t))
      (not (available ?h))
    )
  )
)