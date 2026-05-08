(define (domain depots-hoist-truck)
  (:requirements :strips :typing)
  (:types
    place
    entity
    hoist truck surface - entity
    pallet crate - surface
  )

  (:predicates
    ;; general location for movable entities (hoists, trucks, pallets, crates when at a place)
    (at ?e - entity ?p - place)

    ;; stacking: crate directly on a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ;; containment: crate inside a truck
    (in ?c - crate ?t - truck)

    ;; resource / state tokens
    (hoist_available ?h - hoist)
    (hoist_holding ?h - hoist ?c - crate)

    ;; a surface or crate has nothing on top (top-of-stack)
    (clear ?x - entity)
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
      ;; hoist becomes busy and holds the crate
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)

      ;; crate is no longer on the surface nor at the place
      (not (on ?c ?s))
      (not (at ?c ?p))

      ;; surface becomes clear; held crate is not clear (not a resting surface)
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
      ;; hoist releases crate and becomes available
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)

      ;; crate ends up on surface and at the place
      (on ?c ?s)
      (at ?c ?p)

      ;; crate is a top element; surface now not clear
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
      ;; hoist releases crate and becomes available
      (not (hoist_holding ?h ?c))
      (hoist_available ?h)

      ;; crate is now contained in the truck and not at the place
      (in ?c ?t)
      (not (at ?c ?p))

      ;; crate is not considered a clear surface while inside truck / being stowed
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
      ;; hoist becomes busy and holds the crate; crate removed from truck
      (not (hoist_available ?h))
      (hoist_holding ?h ?c)

      (not (in ?c ?t))

      ;; while held, crate is not a "clear resting" surface
      (not (clear ?c))
    )
  )

  ;; DRIVE TRUCK: move a truck from one place to another (complete connectivity)
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