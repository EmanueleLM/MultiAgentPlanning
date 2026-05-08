(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    place 
    depot distributor - place 
    truck 
    hoist 
    surface 
    crate pallet - surface
  )
  (:predicates
    (at ?o - (either truck hoist crate) ?p - place)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  (:action drive-truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from) (not (= ?from ?to)))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  
  (:action lift-crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?c ?p) (on ?c ?s) (clear ?c) (available ?h) (not (lifting ?h ?c)))
    :effect (and (lifting ?h ?c) (not (on ?c ?s)) (not (available ?h)) (clear ?s))
  )
  
  (:action drop-crate
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (lifting ?h ?c) (clear ?s))
    :effect (and (on ?c ?s) (available ?h) (not (lifting ?h ?c)) (clear ?c) (at ?c ?p))
  )

  (:action load-crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (lifting ?h ?c))
    :effect (and (in ?c ?t) (available ?h) (not (lifting ?h ?c)) (not (at ?c ?p)))
  )

  (:action unload-crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (in ?c ?t) (available ?h))
    :effect (and (lifting ?h ?c) (not (in ?c ?t)) (not (available ?h)) (at ?c ?p))
  )
)