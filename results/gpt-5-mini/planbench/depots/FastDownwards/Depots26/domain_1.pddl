(define (domain depots-hoist-truck)
  (:requirements :strips :typing)
  (:types
    place
    object
    hoist truck surface - object
    pallet crate - surface
  )

  (:predicates
    ;; general location for movable objects (hoists, trucks, pallets, crates when at a place)
    (at ?o - object ?p - place)

    ;; stacking: crate directly on a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; containment: crate inside a truck
    (in ?c - crate ?t - truck)

    ;; resource / state tokens
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)
    (clear ?x - object) ;; a surface or crate is clear (top-of-stack)
  )

  ;; HOIST LIFT: hoist picks a top crate from a co-located surface into the hoist gripper
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)

      (not (on ?c ?s))
      (not (at ?c ?p))

      (clear ?s)
      (not (clear ?c))
    )
  )

  ;; HOIST DROP: hoist places a held crate onto a co-located surface
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist_holding ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)

      (on ?c ?s)
      (at ?c ?p)

      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; HOIST LOAD ONTO TRUCK: hoist loads a held crate into a co-located truck
  (:action hoist-load-onto-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_holding ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)

      (in ?c ?t)
      (not (at ?c ?p))
      (not (clear ?c))
    )
  )

  ;; HOIST UNLOAD FROM TRUCK: hoist extracts a crate from a co-located truck into the hoist gripper
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (hoist_available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)

      (not (in ?c ?t))
      ;; crate is held by hoist and not at the place yet
      (not (clear ?c))
    )
  )

  ;; DRIVE TRUCK: move a truck from one place to another (connectivity is complete among places)
  (:action drive-truck
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at ?t ?from)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )
)