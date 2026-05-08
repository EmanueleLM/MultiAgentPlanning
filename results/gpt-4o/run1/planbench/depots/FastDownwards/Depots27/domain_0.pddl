(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist truck - object
  )
  (:predicates
    (at ?obj - object ?pl - place)
    (clear ?surf - surface)
    (on ?cr - crate ?surf - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?cr - crate)
    (in ?cr - crate ?trk - truck)
  )
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?c ?p) (clear ?c) (available ?h) (on ?c ?s))
    :effect (and (not (at ?c ?p)) (lifting ?h ?c) (not (available ?h)) (clear ?s) (not (on ?c ?s)))
  )
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (lifting ?h ?c) (clear ?s) (at ?h ?p))
    :effect (and (not (lifting ?h ?c)) (available ?h) (at ?c ?p) (not (clear ?s)) (on ?c ?s) (clear ?c))
  )
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (lifting ?h ?c) (at ?t ?p) (at ?h ?p))
    :effect (and (not (lifting ?h ?c)) (available ?h) (in ?c ?t))
  )
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (in ?c ?t) (at ?t ?p) (available ?h) (at ?h ?p))
    :effect (and (not (in ?c ?t)) (lifting ?h ?c) (not (available ?h)))
  )
)