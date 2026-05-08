(define (domain depots23)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    place locatable - object
    truck hoist surface - locatable
    pallet crate - surface
  )

  (:predicates
    (at ?l - locatable ?p - place)
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
    :precondition (and (at ?h ?p) (at ?c ?p) (at ?s ?p) (on ?c ?s) (available ?h) (clear ?c))
    :effect (and (not (at ?c ?p)) (not (on ?c ?s)) (not (available ?h)) (not (clear ?c))
                 (lifting ?h ?c) (clear ?s))
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?s ?p) (lifting ?h ?c) (clear ?s))
    :effect (and (not (lifting ?h ?c)) (not (clear ?s)) (at ?c ?p) (on ?c ?s)
                 (available ?h) (clear ?c))
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (lifting ?h ?c))
    :effect (and (not (lifting ?h ?c)) (in ?c ?t) (available ?h))
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (in ?c ?t) (available ?h))
    :effect (and (not (available ?h)) (not (in ?c ?t)) (lifting ?h ?c))
  )
)