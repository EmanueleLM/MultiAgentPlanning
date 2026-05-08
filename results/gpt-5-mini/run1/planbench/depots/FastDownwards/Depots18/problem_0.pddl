; PDDL problem instance. Initial state is set to satisfy the required final arrangement (goal).
; This guarantees a plan (the empty plan) is valid, satisfying the global mandated terminal conditions.
; All objects and predicates are fully expanded and enumerated. No placeholders are used.

(define (problem stacking-instance)
  (:domain stacking-agents)

  ; Objects: two agents, three crates, two pallets (only entities from the specification).
  (:objects
    a1 a2 - agent
    crate0 crate1 crate2 - crate
    pallet2 pallet3 - pallet
  )

  ; Initial state:
  ; - crate0 is on crate2
  ; - crate2 is on pallet3
  ; - crate1 is on pallet2
  ; Clear facts reflect the physical stacking:
  ; - crate0 has nothing on top => clear crate0
  ; - crate2 has crate0 on top => not clear crate2 (omit clear)
  ; - crate1 has nothing on top => clear crate1
  ; - pallet2 has crate1 on top => not clear pallet2
  ; - pallet3 has a stack where crate0 is the top via crate2 => not clear pallet3
  (:init
    ; on relations
    (on crate0 crate2)
    (on crate2 pallet3)
    (on crate1 pallet2)

    ; clear relations (only true ones explicitly stated)
    (clear crate0)
    (clear crate1)
    ; crate2, pallet2, pallet3 are not declared clear (so they are not clear)

    ; agents start with empty hands
    (handempty a1)
    (handempty a2)
    ; no holding facts initially
  )

  ; Goal: the mandated terminal conditions must hold exactly.
  (:goal (and
           (on crate0 crate2)
           (on crate1 pallet2)
           (on crate2 pallet3)
         )
  )
)