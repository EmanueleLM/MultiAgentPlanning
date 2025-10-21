; Problem: multi-agent block stacking with explicit vowel/consonant capability constraints.
; Conservative modeling choices / notes:
; - Two agent roles are modelled implicitly by separate action schemas: move-vowel-* (vowel-agent)
;   and move-consonant-* (consonant-agent). There are no explicit agent objects in actions.
; - We model top-only moves with the (clear ?b) predicate. Only blocks with (clear ?b) may be picked up.
; - Placing a block on the table is modelled with (ontable ?b).
; - We include three variant actions for each agent:
;     - from block to block, from table to block, and from block to table.
;   This avoids conditional effects and stays within STRIPS + negative preconditions.
; - Vowel/consonant classification is encoded with (vowel ...) and (consonant ...) facts; action preconditions
;   require the appropriate classification. This enforces capability constraints strictly.
; - Assumption: exactly one "move" occurs at a time (classical sequential planning).
; - No parallel/multi-agent concurrency is modelled; cooperation is enforced by action availability only.
; - All natural-language preferences from the inputs were encoded as hard constraints (who may move which blocks).
; - No other external actions or agents exist beyond the capability-specified moves.

(define (problem build-tower)
  (:domain mult-agent-blocks)

  (:objects
    H I C D K F E L G J A B - block
  )

  (:init
    ; Block classification (vowels vs consonants)
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
    ; Stack1: H (table) with C on H, K on C, F on K, G on F (G top)
    (ontable H)
    (on C H)
    (on K C)
    (on F K)
    (on G F)

    ; Stack2: I (table) with D on I, E on D, J on E (J top)
    (ontable I)
    (on D I)
    (on E D)
    (on J E)

    ; Stack3: L (table) with A on L, B on A (B top)
    (ontable L)
    (on A L)
    (on B A)

    ; Clear (top) blocks initially: G, J, B
    (clear G)
    (clear J)
    (clear B)

    ; Note: We do not assert clear for other blocks; they will become clear via actions.
  )

  (:goal
    (and
      ; Goal is a single tower with L on the table, then K on L, J on K, I on J, H on I, G on H,
      ; F on G, E on F, D on E, C on D, B on C, A on B
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
      ; ensure top of final tower is A
      (clear A)
    )
  )

  ; Additional explanatory comments (kept in problem file for planner user):
  ; - The action schemas in the domain strictly separate vowel and consonant manipulators.
  ; - If any vowel/consonant predicate is missing for an object, that block cannot be moved by that agent;
  ;   here all blocks are explicitly classified.
  ; - This PDDL encodes the exact public initial state and the stated goal tower ordering.
)