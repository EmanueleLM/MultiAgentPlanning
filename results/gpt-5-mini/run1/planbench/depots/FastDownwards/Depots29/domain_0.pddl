(define (domain depot-hoist)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent crate pallet place)

  (:predicates
    ;; Locations
    (agent-at ?a - agent ?l - place)
    (at ?c - crate ?l - place)            ;; crate is at a place
    (on ?c - crate ?p - pallet)           ;; crate is on a pallet

    ;; Pallet placement
    (pallet-at ?p - pallet ?l - place)    ;; pallet is at a place
    (pallet-empty ?p - pallet)            ;; pallet has no crate yet

    ;; Operational state
    (ready-for-hoist ?c - crate)          ;; crate has been moved to hoist platform and is ready
    (depot-operator ?a - agent)           ;; agent is the depot operator
    (hoist-operator ?a - agent)           ;; agent is the hoist operator
  )

  ;; Depot operator carries a crate from storage to the hoist platform.
  ;; This action both moves the depot operator and the crate to the hoist platform
  ;; and marks the crate ready for hoisting. Only an agent declared as a depot-operator can execute it.
  (:action depot_carry_to_hoist
    :parameters (?ag - agent ?c - crate)
    :precondition (and
      (depot-operator ?ag)
      (agent-at ?ag storage)
      (at ?c storage)
    )
    :effect (and
      ;; crate moved to hoist platform and marked ready
      (not (at ?c storage))
      (at ?c hoist_platform)
      (ready-for-hoist ?c)

      ;; depot operator moved with the crate to hoist platform
      (not (agent-at ?ag storage))
      (agent-at ?ag hoist_platform)
    )
  )

  ;; Hoist operator places a ready crate from the hoist platform onto a specific pallet.
  ;; Requires the crate to be at the hoist platform and marked ready, the pallet to be empty,
  ;; and the executing agent to be the hoist operator and be positioned at the hoist platform.
  (:action hoist_place_on_pallet
    :parameters (?ag - agent ?c - crate ?p - pallet ?pl - place)
    :precondition (and
      (hoist-operator ?ag)
      (agent-at ?ag hoist_platform)
      (at ?c hoist_platform)
      (ready-for-hoist ?c)
      (pallet-at ?p ?pl)
      (pallet-empty ?p)
    )
    :effect (and
      ;; crate removed from hoist platform and placed on the pallet
      (not (at ?c hoist_platform))
      (not (ready-for-hoist ?c))
      (on ?c ?p)

      ;; pallet no longer empty
      (not (pallet-empty ?p))
    )
  )
)