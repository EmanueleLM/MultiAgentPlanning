; Problem: mult-agent block stacking (FastDownward compatible)
; Notes / conservative modeling choices:
; - Two agent roles are modeled implicitly by separate action schemas prefixed with
;   move-vowel-* (vowel-agent) and move-consonant-* (consonant-agent). There are no explicit
;   agent objects in actions (classical sequential planning).
; - Top-only single-block moves are enforced via (clear ?b) predicates. Only blocks with
;   (clear ?b) may be picked up. All moves are single-block pick-and-place.
; - Placing on the table is modeled by (ontable ?b). Table-to-block and block-to-table
;   actions are distinct to stay within STRIPS.
; - Vowel vs consonant capability restrictions are enforced with (vowel ...) and (consonant ...) facts.
; - If any block classification were missing it would be immovable by the corresponding agent;
;   here all blocks are explicitly classified.
; - Assumption: classical sequential execution (one action at a time). No explicit concurrency.
; - This PDDL verifies the concrete proposed solution listed separately (above). The goal
;   itself encodes only the final configuration (not the particular action sequence).

(define (problem build-tower)
  (:domain mult-agent-blocks)

  (:objects
    H I C D K F E L G J A B - block
  )

  (:init
    ; Vowel vs consonant classification
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)

    ; Initial stacks (public initial state):
    ; Stack1 (S1): H (table), C on H, K on C, F on K, G on F
    (ontable H)
    (on C H)
    (on K C)
    (on F K)
    (on G F)

    ; Stack2 (S2): I (table), D on I, E on D, J on E
    (ontable I)
    (on D I)
    (on E D)
    (on J E)

    ; Stack3 (S3): L (table), A on L, B on A
    (ontable L)
    (on A L)
    (on B A)

    ; Initially clear (tops): G, J, B
    (clear G)
    (clear J)
    (clear B)
    ; Other blocks are not declared clear initially; they become clear via actions.
  )

  (:goal
    (and
      ; Goal tower bottom->top: L, K, J, I, H, G, F, E, D, C, B, A
      (ontable L)
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
      ; ensure topmost block is clear (A)
      (clear A)
    )
  )

  ; Comments:
  ; - The domain enforces that vowel actions can only handle vowel-labeled blocks (A,E,I)
  ;   and consonant actions can only handle the others.
  ; - Top-only restriction is enforced by requiring (clear ?x) to pick up ?x and (clear ?t)
  ;   for placing on a target block ?t.
  ; - The proposed concrete solution (listed above) uses only the provided action schemas.
  ; - If a planner is run on this domain/problem, it should find a plan that achieves the goal;
  ;   the provided proposed_solution is one valid sequential plan that respects all constraints.
)