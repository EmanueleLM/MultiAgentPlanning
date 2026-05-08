(define (domain depots17)
  (:requirements :strips :typing)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist truck - object
  )

  (:predicates
    (at ?o - object ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
    (available ?h - hoist)
    (clear ?s - surface)
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?c ?p) (at ?s ?p) (available ?h) (clear ?c) (on ?c ?s))
    :effect (and (not (at ?c ?p)) (not (available ?h)) (not (on ?c ?s)) (lifting ?h ?c) (clear ?s))
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?s ?p) (clear ?s) (lifting ?h ?c))
    :effect (and (available ?h) (not (lifting ?h ?c)) (at ?c ?p) (not (clear ?s)) (clear ?c) (on ?c ?s))
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (lifting ?h ?c))
    :effect (and (in ?c ?t) (available ?h) (not (lifting ?h ?c)))
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (available ?h) (in ?c ?t))
    :effect (and (not (in ?c ?t)) (not (available ?h)) (lifting ?h ?c))
  )
)