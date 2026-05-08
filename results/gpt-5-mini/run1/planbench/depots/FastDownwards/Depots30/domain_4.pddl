(define (domain depots_repaired)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    truck
    hoist
    surface
      pallet crate - surface
  )

  (:predicates
    ;; locations
    (at_truck ?t - truck ?p - place)
    (at_hoist ?h - hoist ?p - place)
    (at_surface ?s - surface ?p - place)

    ;; support relations (stacking)
    (on ?c - crate ?s - surface)
    (clear ?s - surface)

    ;; hoist state and truck content
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (in_truck ?c - crate ?t - truck)
  )

  ;; drive: move a truck from one place to another (explicit place precondition)
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at_truck ?t ?from)
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; lift: hoist lifts a crate from a surface at a place
  ;; Preconditions: hoist and surface at same place, crate on that surface, hoist available, crate clear
  (:action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (not (at_surface ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
      (not (available ?h))
    )
  )

  ;; drop: hoist drops a lifted crate to a surface at a place
  (:action drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_surface ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (at_surface ?c ?p)
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
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; unload: hoist unloads a crate from a truck at a place (hoist picks crate from truck)
  (:action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at_hoist ?h ?p)
      (at_truck ?t ?p)
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