; Problem: Build the single stack K J I H G F E D C B A (K on the table, J on K, I on J, ..., A on B).
; Assumptions (explicit, minimal):
; - Initial configuration is not provided by the agents' analyses. To allow multi-step rearrangement
;   we assume each block starts on the table and is clear (each is a separate one-block stack).
; - There are two agents distinguished only by which blocks they may move:
;     * agentV actions may move only blocks typed as 'vowel' (A, E, I).
;     * agentC actions may move only blocks typed as 'consonant' (B, C, D, F, G, H, J, K).
; - These preferences/permissions are treated as hard constraints (enforced by typing in actions).
; - The domain enforces top-only movement (via clear precondition) and one-block-at-a-time moves.
; The planner used must support :typing and :negative-preconditions (e.g., Fast Downward).

(define (problem build_stack)
  (:domain blocks_agents)
  (:objects
    A E I - vowel
    B C D F G H J K - consonant
  )

  (:init
    ; all blocks initially on the table and clear (one-block stacks)
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)
  )

  (:goal (and
    (ontable K)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)