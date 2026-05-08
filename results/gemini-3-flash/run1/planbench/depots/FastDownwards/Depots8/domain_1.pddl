(define (domain depots)
  (:requirements :strips :typing)
  (:types
    place - object
    depot distributor - place
    locatable - object
    truck hoist surface - locatable
    pallet crate - surface
  )

  (:predicates
    (at ?obj - locatable ?p - place)
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
    :precondition (and (at ?h ?p) (at ?c ?p) (at ?s ?p) (available ?h) (on ?c ?s) (clear ?c))
    :effect (and (not (at ?c ?p)) (not (available ?h)) (not (on ?c ?s)) (not (clear ?c))
                 (lifting ?h ?c) (clear ?s))
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and (at ?h ?p) (at ?s ?p) (lifting ?h ?c) (clear ?s))
    :effect (and (at ?c ?p) (on ?c ?s) (clear ?c) (available ?h)
                 (not (lifting ?h ?c)) (not (clear ?s)))
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (lifting ?h ?c))
    :effect (and (in ?c ?t) (available ?h) (not (lifting ?h ?c)))
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and (at ?h ?p) (at ?t ?p) (available ?h) (in ?c ?t))
    :effect (and (lifting ?h ?c) (not (available ?h)) (not (in ?c ?t)))
  )
)