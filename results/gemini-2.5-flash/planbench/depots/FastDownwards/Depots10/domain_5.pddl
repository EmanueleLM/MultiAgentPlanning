(define (domain depots-domain)
  (:requirements :strips :typing :negative-preconditions :action-costs :derived-predicates)
  (:types
    place
    surface
    truck
    hoist
    crate - surface
    pallet - surface
  )
  (:predicates
    (at ?x - (either truck hoist pallet crate), ?p - place)
    (on ?c - crate, ?s - surface)
    (in ?c - crate, ?t - truck)
    (clear ?s - surface)
    (available ?h - hoist)
    (direct-road ?p1 ?p2 - place) ; Base predicate for one-way road segments
    (holding ?h - hoist ?c - crate)
  )

  ; Derived predicate for bidirectional connectivity between places
  ; This reduces the number of initial 'connected' facts by half.
  (:derived (connected ?p1 ?p2 - place)
    (or (direct-road ?p1 ?p2)
        (direct-road ?p2 ?p1)
    )
  )

  (:functions
    (total-cost) - number
  )

  (:action drive
    :parameters (?t - truck ?from ?to - place)
    :precondition (and
      (at ?t ?from)
      (connected ?from ?to) ; Uses the derived predicate
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
      (on ?c ?s)
      (at ?s ?p)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (clear ?s)
      (not (available ?h))
      (holding ?h ?c)
      (not (at ?c ?p))
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
      (at ?c ?p)
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
      (increase (total-cost) 1)
    )
  )
)