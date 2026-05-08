(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    hoist truck
    pallet crate
  )
  ;; depot and distributor are subtypes of place
  ;; (In PDDL type declarations, list subtypes after a dash.)
  ;; To declare them as subtypes:
  ;; note: some planners accept 'depot distributor - place' in :types, but to keep explicit,
  ;; we will treat them conceptually as places and use them in the problem objects with those types.

  (:predicates
    ;; location: hoists, trucks, pallets, crates are located at a place
    (at ?obj - (either hoist truck pallet crate) ?p - place)

    ;; support relation: a crate directly on a surface (pallet or crate)
    (on ?c - crate ?s - (either pallet crate))

    ;; crate inside a truck
    (in_truck ?c - crate ?t - truck)

    ;; hoist holding a crate
    (holding ?h - hoist ?c - crate)

    ;; hoist available (not holding)
    (available ?h - hoist)

    ;; a surface (pallet or crate) has no direct occupant
    (clear ?s - (either pallet crate))

    ;; road connectivity (symmetric); domain/problem will assert all pairs as connected
    (connected ?from - place ?to - place)
  )

  ;; Action names are prefixed to reflect agent-type where appropriate:
  ;; - truck-drive actions are named drive-truck
  ;; - hoist actions are named hoist-*
  ;; All preconditions and effects are explicit and maintain invariants described in the audit.

  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (connected ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
      (not (= ?s ?c))
    )
    :effect (and
      (holding ?h ?c)
      (clear ?s)                 ;; since model enforces single direct occupant, removing on makes surface clear
      (not (on ?c ?s))
      (not (at ?c ?p))
      (not (available ?h))
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place)
    :precondition (and
      (at ?h ?p)
      (holding ?h ?c)
      (at ?s ?p)
      (clear ?s)
      (not (= ?s ?c))
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
      (not (holding ?h ?c))
      (not (clear ?s))
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (holding ?h ?c)
      (at ?t ?p)
    )
    :effect (and
      (in_truck ?c ?t)
      (available ?h)
      (not (holding ?h ?c))
      (not (at ?c ?p))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?t ?p)
      (in_truck ?c ?t)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (not (in_truck ?c ?t))
      (not (available ?h))
    )
  )
)