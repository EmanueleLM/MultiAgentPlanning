(define (domain multiagent_hoist_truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist pallet crate)

  (:predicates
    ;; Locations
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (at ?s - (either pallet crate) ?p - place)

    ;; stacking / containment / holding
    (on ?c - crate ?s - (either pallet crate))
    (in_truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)

    ;; resource / state flags
    (hoist_available ?h - hoist)
    (clear ?x - (either pallet crate))
  )

  ;; Drive a truck from one place to another (must be at origin)
  (:action orchestrator-drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?t ?from)
      (not (truck_at ?t ?to))
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  ;; Lift a crate from a surface at a place with a hoist
  (:action hoist_operator-lift
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (hoist_available ?h)
      (clear ?c)
    )
    :effect (and
      (holding ?h ?c)
      (not (hoist_available ?h))
      ;; crate is removed from surface and place while held
      (not (on ?c ?s))
      (not (at ?c ?p))
      ;; surface becomes clear once its top crate is lifted
      (clear ?s)
      ;; held crate is (conceptually) clear (nothing on it while held)
      (clear ?c)
    )
  )

  ;; Drop a crate from a hoist onto a surface at a place
  (:action hoist_operator-drop
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (at ?s ?p)
      (holding ?h ?c)
      (clear ?s)
    )
    :effect (and
      (hoist_available ?h)
      (not (holding ?h ?c))
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; Load a held crate into a truck at the same place
  (:action hoist_operator-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in_truck ?c ?t)
      (hoist_available ?h)
      (clear ?c)
      (not (holding ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; Unload a crate from a truck: hoist becomes busy and holds the crate
  (:action hoist_operator-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist_at ?h ?p)
      (truck_at ?t ?p)
      (hoist_available ?h)
      (in_truck ?c ?t)
    )
    :effect (and
      (holding ?h ?c)
      (not (in_truck ?c ?t))
      (not (hoist_available ?h))
    )
  )
)