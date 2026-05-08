(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    hoist
    truck
  )
  (:predicates
    (at ?entity - (either hoist truck crate) ?place - place)
    (available ?h - hoist)
    (clear ?s - surface)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (lifting ?h - hoist ?c - crate)
  )
  (:action drive
    :parameters (?t - truck ?p1 - place ?p2 - place)
    :precondition (and (at ?t ?p1) (not (= ?p1 ?p2)))
    :effect (and (not (at ?t ?p1)) (at ?t ?p2))
  )
  (:action lift
    :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
    :precondition (and (at ?h ?p) (at ?c ?p) (available ?h) (clear ?c) (on ?c ?s))
    :effect (and (not (at ?c ?p)) (lifting ?h ?c) (not (available ?h)) (clear ?s) (not (on ?c ?s)))
  )
  (:action drop
    :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
    :precondition (and (at ?h ?p) (clear ?s) (lifting ?h ?c))
    :effect (and (not (lifting ?h ?c)) (at ?c ?p) (available ?h) (on ?c ?s) (not (clear ?s)) (clear ?c))
  )
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (lifting ?h ?c))
    :effect (and (not (lifting ?h ?c)) (available ?h) (in ?c ?t))
  )
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (available ?h) (in ?c ?t))
    :effect (and (not (in ?c ?t)) (lifting ?h ?c) (not (available ?h)))
  )
)