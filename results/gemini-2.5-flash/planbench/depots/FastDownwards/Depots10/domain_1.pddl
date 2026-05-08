(define (domain depots-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    place
    surface
    truck
    hoist
    crate - surface
    pallet - surface
  )
  (:predicates
    (at ?x - (truck hoist pallet crate), ?p - place)
    (on ?c - crate, ?s - surface)
    (in ?c - crate, ?t - truck)
    (clear ?s - surface)
    (available ?h - hoist)
    (connected ?p1 ?p2 - place)
    (holding ?h - hoist ?c - crate)
  )
  (:functions
    (total-cost) - number
  )

  (:action drive
    :parameters (?t - truck ?from ?to - place)
    :precondition (and
      (at ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (increase (total-cost) 1)
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (available ?h)
      (at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (clear ?c))
      (clear ?s)
      (not (available ?h))
      (holding ?h ?c)
      (increase (total-cost) 1)
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
      (increase (total-cost) 1)
    )
  )

  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (in ?c ?t)
      (not (at ?c ?p)) ; Crate is now inside the truck, no longer "at" the place independently
      (increase (total-cost) 1)
    )
  )

  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (not (available ?h))
      (holding ?h ?c)
      (not (in ?c ?t))
      (at ?c ?p) ; Crate is now at the place, held by the hoist
      (increase (total-cost) 1)
    )
  )
)