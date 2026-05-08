(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    place - object
    depot distributor - place
    surface - object
    pallet crate - surface
    truck hoist - object
  )

  ;; Predicates
  ;; location for any object (truck, hoist, pallet, crate) at a place
  (:predicates
    (at ?o - object ?p - place)
    ;; surface-on-surface: top is a surface (crate or pallet) placed on another surface (crate or pallet)
    (on ?top - surface ?bottom - surface)
    ;; crate is inside a truck
    (in ?c - crate ?t - truck)
    ;; hoist availability and lifting status
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    ;; nothing on top of a surface (pallet or crate)
    (clear ?s - surface)
    ;; connectivity among places (explicitly provided in initial state)
    (reachable ?p1 - place ?p2 - place)
    ;; ordering helper: if true initially for a truck, that truck must be used to load cargo
    ;; before it is allowed to drive away. This enforces the agent-specified ordering constraint.
    (must-be-loaded ?t - truck)
  )

  ;; DRIVE: move a truck between places that are connected.
  ;; Note: crates that are in a truck are transported implicitly because the in relation is unchanged.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (reachable ?from ?to)
      (not (must-be-loaded ?tr)) ;; enforce that required loads into this truck happen before it drives
    )
    :effect (and
      (at ?tr ?to)
      (not (at ?tr ?from))
    )
  )

  ;; HOIST LIFT: hoist lifts a crate from a surface at a place.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (clear ?s)
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (available ?h))
    )
  )

  ;; HOIST DROP: hoist places a lifted crate onto a surface at the same place.
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?p)
      (clear ?c)
      (available ?h)
      (not (lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; HOIST LOAD INTO TRUCK: hoist places the crate it is holding into a co-located truck.
  ;; This action also clears any must-be-loaded requirement for the truck,
  ;; enforcing the ordering: a required load must happen before that truck may drive.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (available ?h)
      (not (lifting ?h ?c))
      ;; remove any drive-blocking requirement for this truck (if present)
      (not (must-be-loaded ?tr))
    )
  )

  ;; HOIST UNLOAD FROM TRUCK: hoist takes a crate out of a co-located truck and becomes the lifter.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (lifting ?h ?c)
      (not (in ?c ?tr))
      (not (available ?h))
    )
  )

)