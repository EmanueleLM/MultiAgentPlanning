(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    distributor depot - place
    transportable
    crate - transportable
    surface
    pallet - surface
    hoist
    truck
  )

  (:predicates
    (at ?x - (hoist truck transportable) ?p - place)
    (available ?h - hoist)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (lifting ?h - hoist ?c - crate)
    (in ?c - crate ?t - truck)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?c ?p) (clear ?c) (on ?c ?s) (available ?h))
    :effect (and (not (at ?c ?p)) (not (on ?c ?s)) (lifting ?h ?c) (not (available ?h)) (clear ?s))
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (lifting ?h ?c) (clear ?s) (at ?s ?p))
    :effect (and (at ?c ?p) (on ?c ?s) (clear ?c) (not (lifting ?h ?c)) (available ?h) (not (clear ?s)))
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (lifting ?h ?c))
    :effect (and (in ?c ?t) (not (lifting ?h ?c)) (available ?h))
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (in ?c ?t) (available ?h))
    :effect (and (not (in ?c ?t)) (lifting ?h ?c) (not (available ?h)))
  )
)