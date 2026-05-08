(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    transporter - object
    truck - transporter
    lifting_device - object
    hoist - lifting_device
  )
  (:predicates
    (at ?p - place ?o - object)
    (in ?t - truck ?c - crate)
    (on ?s - surface ?c - crate)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (clear ?s - surface)
  )
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?from ?t))
    :effect (and (not (at ?from ?t)) (at ?to ?t))
  )
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?p ?h) (at ?p ?c) (available ?h) (on ?s ?c) (clear ?c))
    :effect (and (not (at ?p ?c)) (lifting ?h ?c) (not (available ?h)) (clear ?s) (not (on ?s ?c)))
  )
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?p ?h) (lifting ?h ?c) (clear ?s))
    :effect (and (available ?h) (not (lifting ?h ?c)) (at ?p ?c) (not (clear ?s)) (clear ?c) (on ?s ?c))
  )
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?p ?h) (at ?p ?t) (lifting ?h ?c))
    :effect (and (not (lifting ?h ?c)) (not (available ?h)) (in ?t ?c))
  )
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?p ?h) (at ?p ?t) (available ?h) (in ?t ?c))
    :effect (and (not (in ?t ?c)) (lifting ?h ?c) (not (available ?h)) (at ?p ?c))
  )
)