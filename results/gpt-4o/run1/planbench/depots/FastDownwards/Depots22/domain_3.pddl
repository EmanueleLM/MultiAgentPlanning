(define (domain depots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    depot distributor - place
    pallet crate - surface
    truck hoist - object
  )
  (:predicates
    (at ?x - (either truck hoist crate) ?p - place)
    (in ?c - crate ?t - truck)
    (on ?c - surface ?b - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )
  (:action drive-truck
    :parameters (?t - truck ?p1 - place ?p2 - place)
    :precondition (and
      (at ?t ?p1)
    )
    :effect (and
      (not (at ?t ?p1))
      (at ?t ?p2)
    )
  )
  (:action lift-crate
    :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (at ?c ?p))
      (not (available ?h))
      (lifting ?h ?c)
      (clear ?s)
      (not (on ?c ?s))
    )
  )
  (:action drop-crate
    :parameters (?h - hoist ?c - crate ?b - surface ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?p)
      (clear ?b)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (on ?c ?b)
      (not (clear ?b))
      (clear ?c)
    )
  )
  (:action load-crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (lifting ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (in ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
    )
  )
  (:action unload-crate
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (available ?h)
      (in ?c ?t)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (lifting ?h ?c)
      (not (available ?h))
      (not (in ?c ?t))
    )
  )
)