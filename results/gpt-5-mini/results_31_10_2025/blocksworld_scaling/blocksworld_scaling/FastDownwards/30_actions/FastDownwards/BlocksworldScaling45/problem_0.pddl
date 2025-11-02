(define (problem orchestrated-stacking)
  (:domain multiagent-blocks)

  ; Objects: two distinct table places (pos1 and pos2) and 15 uniquely labelled blocks.
  (:objects
    pos1 pos2 - place
    O K B J M F A L D C N G I E H - block
  )

  ; Initial state encodes the two stacks (bottom-to-top) and which supports are currently top.
  ; Comments below explain modelling assumptions and the resolution of agent preferences:
  ; - The predicate (immobile O) encodes the vowel-agent's explicit commitment that O will not be moved.
  ; - Only two table places exist (pos1 and pos2); agents may not create new table positions.
  ; - All moves are top-only and require the destination support to be top (clear).
  ; - Agents' soft preferences were treated as hard constraints where explicitly stated (e.g., O immobile).
  ; - If the local plans required additional ephemeral supports or deviated from "two stacks", this problem
  ;   conservatively forbids creating new places and expects coordination by ordering moves that use pos1/pos2.
  ; - The domain actions are agent-specific (move-vowel, move-consonant) so a planner can schedule them respecting
  ;   which agent may move which block.
  ; - The initial 'top' facts mark which supports (blocks or places) are currently clear (have no block on them).
  ;   In the block-stack representation, a support is "top" exactly when nothing sits on it (i.e., it is the current top).
  ; - The action schema requires providing the explicit support that a block currently sits on (the ?below parameter),
  ;   so each move precisely reveals which support becomes top after the removal.

  (:init
    ; Stack at pos1 from bottom to top: O, K, B, J, M, F
    (on O pos1)
    (on K O)
    (on B K)
    (on J B)
    (on M J)
    (on F M)

    ; Stack at pos2 from bottom to top: A, L, D, C, N, G, I, E, H
    (on A pos2)
    (on L A)
    (on D L)
    (on C D)
    (on N C)
    (on G N)
    (on I G)
    (on E I)
    (on H E)

    ; Top facts: which supports currently have nothing on them (the visible/top blocks are F and H)
    (top F)
    (top H)

    ; The table places themselves are not top because blocks sit on them initially.
    ; (top pos1) and (top pos2) are therefore not true in the initial state.

    ; Label each block as vowel or consonant according to English letters used here.
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

    (consonant K)
    (consonant B)
    (consonant J)
    (consonant M)
    (consonant F)
    (consonant L)
    (consonant D)
    (consonant C)
    (consonant N)
    (consonant G)
    (consonant H)

    ; The vowel-agent explicitly declared it will not move O (hard constraint encoded here).
    (immobile O)
  )

  ; Goal: a single chain (stack) at pos1 with the specified order from bottom (O) upward through A.
  ; The goal relation ordering is: O on pos1; N on O; M on N; L on M; K on L; J on K; I on J; H on I;
  ; G on H; F on G; E on F; D on E; C on D; B on C; A on B.
  (:goal (and
    (on O pos1)
    (on N O)
    (on M N)
    (on L M)
    (on K L)
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