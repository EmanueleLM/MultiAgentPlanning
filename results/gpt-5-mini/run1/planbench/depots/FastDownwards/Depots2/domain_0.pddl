(define (domain depot-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    driver
    hoist_op
    manager
    auditor
    crate
    pallet
    location
  )

  (:predicates
    ;; locations and positions
    (at ?c - crate ?l - location)
    (pallet_at ?p - pallet ?l - location)

    ;; hoist/resource state
    (hoist_free)

    ;; attachment / lift state
    (hoist_attached ?c - crate)
    (in_lift ?c - crate)

    ;; authorizations and availability
    (authorized ?op - hoist_op ?c - crate ?p - pallet)
    (manager_available ?m - manager)
    (driver_available ?d - driver)
    (auditor_available ?a - auditor)

    ;; pallet occupancy / stack semantics
    (empty_pallet ?p - pallet)
    (crate_on_pallet ?c - crate ?p - pallet)

    ;; audit/closure
    (inspected ?c - crate ?p - pallet)
    (finalized ?c - crate ?p - pallet)
  )

  ;; Manager action: grant authorization for a specific hoist operator to handle a specific crate->pallet transfer.
  ;; This must be done before the hoist operator can attach/operate for that crate/pallet pair.
  (:action manager_authorize
    :parameters (?m - manager ?op - hoist_op ?c - crate ?p - pallet)
    :precondition (and
      (manager_available ?m)
      (empty_pallet ?p)
      (not (authorized ?op ?c ?p))
    )
    :effect (and
      (authorized ?op ?c ?p)
    )
  )

  ;; Driver action: move a pallet from one location to another (e.g., from storage to hoist area).
  ;; Enforces exclusivity of pallet position - cannot state same pallet in both locations.
  (:action driver_position_pallet
    :parameters (?d - driver ?p - pallet ?from - location ?to - location)
    :precondition (and
      (driver_available ?d)
      (pallet_at ?p ?from)
      (not (pallet_at ?p ?to))
    )
    :effect (and
      (pallet_at ?p ?to)
      (not (pallet_at ?p ?from))
    )
  )

  ;; Hoist operator action: attach a crate to the hoist.
  ;; Requires that manager authorization exists for this op/crate/pallet and the pallet is positioned at the same location.
  ;; Reserves the hoist resource (hoist_free -> not hoist_free) and marks the crate as in-lift.
  (:action hoistop_attach
    :parameters (?op - hoist_op ?c - crate ?p - pallet ?l - location)
    :precondition (and
      (authorized ?op ?c ?p)
      (pallet_at ?p ?l)
      (at ?c ?l)
      (hoist_free)
      (empty_pallet ?p)
      (not (hoist_attached ?c))
    )
    :effect (and
      (hoist_attached ?c)
      (in_lift ?c)
      (not (hoist_free))
      (not (at ?c ?l))
    )
  )

  ;; Hoist operator action: place the attached crate onto the pallet at the same location.
  ;; This makes the pallet occupied (not empty) and frees the hoist.
  (:action hoistop_place
    :parameters (?op - hoist_op ?c - crate ?p - pallet ?l - location)
    :precondition (and
      (hoist_attached ?c)
      (in_lift ?c)
      (pallet_at ?p ?l)
    )
    :effect (and
      (crate_on_pallet ?c ?p)
      (not (empty_pallet ?p))
      (not (hoist_attached ?c))
      (not (in_lift ?c))
      (hoist_free)
    )
  )

  ;; Auditor action: inspect a crate that has been placed on a pallet.
  ;; Inspection is required before finalization by the manager.
  (:action auditor_inspect
    :parameters (?a - auditor ?c - crate ?p - pallet)
    :precondition (and
      (auditor_available ?a)
      (crate_on_pallet ?c ?p)
      (not (inspected ?c ?p))
    )
    :effect (and
      (inspected ?c ?p)
    )
  )

  ;; Manager action: finalize a placed and inspected crate.
  ;; Finalization records closure and is only possible after inspection.
  (:action manager_finalize
    :parameters (?m - manager ?c - crate ?p - pallet)
    :precondition (and
      (manager_available ?m)
      (inspected ?c ?p)
      (crate_on_pallet ?c ?p)
      (not (finalized ?c ?p))
    )
    :effect (and
      (finalized ?c ?p)
    )
  )
)