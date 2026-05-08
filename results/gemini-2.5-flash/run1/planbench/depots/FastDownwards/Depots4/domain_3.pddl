(define (domain depots4)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    hoist - object
    truck - object
  )

  (:predicates
    (at ?obj - (either crate hoist truck pallet) ?loc - place) ; location of dynamic objects and pallets
    (lifting ?h - hoist ?c - crate) ; hoist is currently lifting a crate
    (available ?h - hoist) ; hoist is free
    (clear ?s - surface) ; nothing is on top of this surface
    (on ?c - crate ?s - surface) ; crate is on a surface (pallet or another crate)
    (in ?c - crate ?t - truck) ; crate is inside a truck
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect
      (and
        (not (at ?t ?from))
        (at ?t ?to)
      )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?c ?p)
        (available ?h)
        (clear ?c) ; The crate itself must be clear to be lifted
        (on ?c ?s) ; The crate must be on a surface
      )
    :effect
      (and
        (not (at ?c ?p)) ; Crate is no longer at the place, it's being lifted
        (lifting ?h ?c)
        (not (available ?h))
        (clear ?s) ; The surface it was on is now clear
        (not (on ?c ?s))
      )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?s ?p) ; The surface must be at the place to drop on it
        (clear ?s) ; The surface must be clear to drop something on it
        (lifting ?h ?c)
      )
    :effect
      (and
        (available ?h)
        (not (lifting ?h ?c))
        (at ?c ?p) ; Crate is now at the place
        (not (clear ?s)) ; The surface is no longer clear
        (clear ?c) ; The crate is now clear on top after being dropped
        (on ?c ?s)
      )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?t ?p)
        (lifting ?h ?c)
      )
    :effect
      (and
        (not (lifting ?h ?c))
        (available ?h)
        (in ?c ?t)
      )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition
      (and
        (at ?h ?p)
        (at ?t ?p)
        (available ?h)
        (in ?c ?t)
      )
    :effect
      (and
        (not (in ?c ?t))
        (not (available ?h))
        (lifting ?h ?c)
      )
  )
)