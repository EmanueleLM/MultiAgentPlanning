(define (domain depots_repaired)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    depot distributor - place
    object
    truck hoist - object
    surface - object
    pallet crate - surface
  )

  (:predicates
    (at ?x - object ?p - place)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)
  )

  ;; drive: move a truck from one place to another
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ;; lift: hoist lifts a crate from a surface at a place
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (lifting ?h ?c)
      (not (at ?c ?p))
      (not (available ?h))
      (not (on ?c ?s))
      (clear ?s)
    )
  )

  ;; drop: hoist drops a lifted crate to a surface at a place
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
      (not (lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; load: hoist loads a lifted crate into a truck at a place
  (:action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; unload: hoist unloads a crate from a truck at a place
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (lifting ?h ?c)
      (not (in_truck ?c ?t))
      (not (available ?h))
    )
  )
)