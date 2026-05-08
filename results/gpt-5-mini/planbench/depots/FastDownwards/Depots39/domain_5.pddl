(define (domain depots_instance)
  (:requirements :strips :typing)
  (:types
    place
    surface
    pallet crate - surface
    hoist truck
  )

  (:predicates
    (at ?o - object ?p - place)            ; hoists, trucks, surfaces, crates can be at places (object is PDDL built-in)
    (on ?c - crate ?s - surface)           ; crate supported by a surface (pallet or crate)
    (clear ?o - object)                    ; nothing on top of this object (applies to surfaces and crates)
    (available ?h - hoist)                 ; hoist free to start lifting
    (lifting ?h - hoist ?c - crate)        ; hoist is currently lifting crate
    (in_truck ?c - crate ?t - truck)       ; crate is inside a truck
  )

  ;; drive: move a truck between places
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (at ?t ?from)
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (at ?c ?p))
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
    )
  )

  ;; hoist drops a lifted crate onto a surface at a place
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at a place
  (:action hoist_load_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (not (at ?c ?p))
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; hoist unloads a crate from a truck at a place (hoist becomes busy and lifts the crate)
  (:action hoist_unload_truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (not (in_truck ?c ?t))
      (not (available ?h))
      (lifting ?h ?c)
    )
  )
)