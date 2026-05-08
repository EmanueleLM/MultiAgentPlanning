(define (domain logistics)

  (:requirements :strips :typing :negative-preconditions)
  
  (:types
    place
    depot distributor - place
    truck
    hoist
    crate
    pallet
    surface
  )
  
  (:predicates
    (at ?x - (truck hoist crate) ?p - place)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )
  
  (:action drive_truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  
  (:action lift_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?c ?p) (on ?c ?s) (clear ?c) (available ?h))
    :effect (and (not (at ?c ?p)) (lifting ?h ?c) (not (available ?h)) (clear ?s) (not (on ?c ?s)))
  )
  
  (:action drop_crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (lifting ?h ?c) (at ?h ?p) (clear ?s))
    :effect (and (available ?h) (not (lifting ?h ?c)) (on ?c ?s) (at ?c ?p) (not (clear ?s)) (clear ?c))
  )
  
  (:action load_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (lifting ?h ?c) (at ?h ?p) (at ?t ?p))
    :effect (and (in ?c ?t) (available ?h) (not (lifting ?h ?c)) (clear ?c))
  )
  
  (:action unload_crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (available ?h) (in ?c ?t))
    :effect (and (lifting ?h ?c) (not (available ?h)) (not (in ?c ?t)))
  )

)