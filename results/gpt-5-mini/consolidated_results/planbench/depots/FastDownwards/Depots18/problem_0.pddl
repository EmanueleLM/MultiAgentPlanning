; Problem: achieve final stacking:
;   crate0 on crate2
;   crate1 on pallet2
;   crate2 on pallet3
; Initial configuration:
;   crate0 on crate1, crate1 on crate2, crate2 on pallet1  (a vertical stack on pallet1)
; Agents agent1 and agent2 start at pallet1 and are free-handed.
; Targets (hard constraints) are encoded via has-target and target-loc predicates.
; The domain enforces that placing onto a support that has a target requires that support already be on its target,
; thereby forcing the necessary ordering (crate2 must be on pallet3 before crate0 is placed on crate2).

(define (problem multi-agent-stack-problem)
  (:domain multi-agent-stack)

  (:objects
    agent1 agent2 - agent
    crate0 crate1 crate2 - crate
    pallet1 pallet2 pallet3 - pallet
  )

  (:init
    ; Initial physical stack: crate0 on crate1, crate1 on crate2, crate2 on pallet1
    (on crate0 crate1)
    (on crate1 crate2)
    (on crate2 pallet1)

    ; Clearness: only the top of the stack (crate0) and empty pallets (pallet2, pallet3) are clear
    (clear crate0)
    (clear pallet2)
    (clear pallet3)

    ; Non-clear items implicit by omission: crate1 and crate2 and pallet1 are not clear.

    ; Agents at pallet1 and free-handed
    (at agent1 pallet1)
    (at agent2 pallet1)
    (free-hand agent1)
    (free-hand agent2)

    ; Target constraints: encode final required placements (hard constraints)
    ; crate0 must end up on crate2
    (has-target crate0)
    (target-loc crate0 crate2)

    ; crate1 must end up on pallet2
    (has-target crate1)
    (target-loc crate1 pallet2)

    ; crate2 must end up on pallet3
    (has-target crate2)
    (target-loc crate2 pallet3)
  )

  ; Goal: all mandated final placements must hold
  (:goal (and
           (on crate0 crate2)
           (on crate1 pallet2)
           (on crate2 pallet3)
         )
  )
)