(define (domain multiagent_hoist_truck)
  :requirements :strips :typing :negative-preconditions
  :types
    place depot distributor
    truck
    hoist
    pallet
    crate
  :predicates
    ;; location predicates
    (truck_at ?t - truck ?p - place)
    (hoist_at ?h - hoist ?p - place)
    (at ?s - (either pallet crate) ?p - place)

    ;; stacking / containment / holding
    (on ?c - crate ?s - (either pallet crate))
    (in_truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)

    ;; resource/state flags
    (hoist_available ?h - hoist)
    (clear ?x - (either pallet crate))
  ;; Actions are prefixed by agent identifiers to keep agents' actions distinct.
  ;; Orchestrator-provided drive action: moves a truck (and implicitly keeps in_truck facts)
  (:action orchestrator-drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (truck_at ?t ?from)
      ;; enforce origin != destination by requiring destination not be the current location
      (not (truck_at ?t ?to))
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
      ;; crates in the truck are preserved implicitly by not touching in_truck facts
    )
  )

  ;; Hoist operator actions
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
      (clear ?s)
      (clear ?c)
      (not (hoist_available ?h))
      (not (on ?c ?s))
      (not (at ?c ?p))
    )
  )

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
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (holding ?h ?c))
      (not (clear ?s))
    )
  )

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
      ;; on relations should not exist while holding; no explicit wildcard delete used
    )
  )

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
      ;; crate is held; at(...) not asserted until drop
    )
  )
)