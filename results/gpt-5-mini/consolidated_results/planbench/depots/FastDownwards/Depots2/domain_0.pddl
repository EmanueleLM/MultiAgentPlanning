(define (domain depot_orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types crate pallet truck location driver hoist auditor)

  (:predicates
    ;; Positions
    (crate-at ?c - crate ?l - location)
    (truck-at ?t - truck ?l - location)
    (hoist-at ?h - hoist ?l - location)
    (pallet-at ?p - pallet ?l - location)

    ;; Load / carry / stack
    (in-truck ?c - crate ?t - truck)
    (hoist-attached ?h - hoist ?c - crate)
    (on-pallet ?c - crate ?p - pallet)

    ;; Resource / capacity / availability flags
    (truck-empty ?t - truck)
    (pallet-empty ?p - pallet)
    (hoist-free ?h - hoist)

    ;; Auditor inspection mark (optional outcome)
    (inspected ?a - auditor)
  )

  ;; Driver actions (namespaced driver_)
  (:action driver_load
    :parameters (?d - driver ?t - truck ?c - crate ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (crate-at ?c ?loc)
      (truck-empty ?t)
    )
    :effect (and
      (not (crate-at ?c ?loc))
      (in-truck ?c ?t)
      (not (truck-empty ?t))
    )
  )

  (:action driver_drive
    :parameters (?d - driver ?t - truck ?from - location ?to - location)
    :precondition (and
      (truck-at ?t ?from)
      ;; forbid no-op moves; require distinct locations
      (not (= ?from ?to))
    )
    :effect (and
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
    )
  )

  ;; Hoist operator actions (namespaced hoistop_)
  (:action hoistop_attach
    :parameters (?h - hoist ?t - truck ?c - crate ?loc - location)
    :precondition (and
      (hoist-at ?h ?loc)
      (truck-at ?t ?loc)
      (in-truck ?c ?t)
      (hoist-free ?h)
    )
    :effect (and
      (not (in-truck ?c ?t))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      ;; crate removed from truck; truck becomes empty again
      (truck-empty ?t)
    )
  )

  (:action hoistop_move
    :parameters (?h - hoist ?from - location ?to - location)
    :precondition (and
      (hoist-at ?h ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (hoist-at ?h ?from))
      (hoist-at ?h ?to)
    )
  )

  (:action hoistop_detach_to_pallet
    :parameters (?h - hoist ?c - crate ?p - pallet ?ploc - location)
    :precondition (and
      (hoist-attached ?h ?c)
      (hoist-at ?h ?ploc)
      (pallet-at ?p ?ploc)
      (pallet-empty ?p)
    )
    :effect (and
      (not (hoist-attached ?h ?c))
      (on-pallet ?c ?p)
      (not (pallet-empty ?p))
      (hoist-free ?h)
    )
  )

  ;; Auditor action (namespaced auditor_)
  (:action auditor_inspect
    :parameters (?a - auditor ?c1 - crate ?p1 - pallet ?c2 - crate ?p2 - pallet)
    :precondition (and
      (on-pallet ?c1 ?p1)
      (on-pallet ?c2 ?p2)
    )
    :effect (and
      (inspected ?a)
    )
  )
)