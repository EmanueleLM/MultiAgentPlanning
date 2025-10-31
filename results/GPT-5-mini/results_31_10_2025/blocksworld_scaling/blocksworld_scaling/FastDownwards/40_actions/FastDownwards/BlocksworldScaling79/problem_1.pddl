; Problem: Blocksworld-Orchestrator-instance
; This problem encodes the initial configuration and the target stack M,L,K,J,I,H,G,F,E,D,C,B,A (M on table).
; The (distinct ...) predicate is fully enumerated for all ordered pairs of different blocks to prevent self-moves.
(define (problem blocks-orch-prob)
  (:domain Blocksworld-Orch)

  (:objects
    K D F M A B L C G I H E J - block
  )

  (:init
    ; Initial stacks (bottom -> ... -> top):
    ; Stack 1: K -> D -> F -> E -> J
    (on D K)
    (on F D)
    (on E F)
    (on J E)
    (on-table K)

    ; Stack 2: M -> L -> G
    (on L M)
    (on G L)
    (on-table M)

    ; Stack 3: A -> B
    (on B A)
    (on-table A)

    ; Stack 4: C -> I -> H
    (on I C)
    (on H I)
    (on-table C)

    ; Top facts (top blocks of each stack)
    (top J)
    (top G)
    (top B)
    (top H)

    ; Vowel / consonant classification (per specification)
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant K)
    (consonant D)
    (consonant F)
    (consonant M)
    (consonant B)
    (consonant L)
    (consonant C)
    (consonant G)
    (consonant H)
    (consonant J)

    ; on-table facts for bottoms of stacks
    (on-table K)
    (on-table M)
    (on-table A)
    (on-table C)

    ; Distinctness facts: enumerate all ordered pairs of distinct blocks to forbid self-moves.
    ; (distinct X Y) means X != Y. We enumerate every pair X,Y where X != Y.
    (distinct K D) (distinct K F) (distinct K M) (distinct K A) (distinct K B) (distinct K L) (distinct K C) (distinct K G) (distinct K I) (distinct K H) (distinct K E) (distinct K J)
    (distinct D K) (distinct D F) (distinct D M) (distinct D A) (distinct D B) (distinct D L) (distinct D C) (distinct D G) (distinct D I) (distinct D H) (distinct D E) (distinct D J)
    (distinct F K) (distinct F D) (distinct F M) (distinct F A) (distinct F B) (distinct F L) (distinct F C) (distinct F G) (distinct F I) (distinct F H) (distinct F E) (distinct F J)
    (distinct M K) (distinct M D) (distinct M F) (distinct M A) (distinct M B) (distinct M L) (distinct M C) (distinct M G) (distinct M I) (distinct M H) (distinct M E) (distinct M J)
    (distinct A K) (distinct A D) (distinct A F) (distinct A M) (distinct A B) (distinct A L) (distinct A C) (distinct A G) (distinct A I) (distinct A H) (distinct A E) (distinct A J)
    (distinct B K) (distinct B D) (distinct B F) (distinct B M) (distinct B A) (distinct B L) (distinct B C) (distinct B G) (distinct B I) (distinct B H) (distinct B E) (distinct B J)
    (distinct L K) (distinct L D) (distinct L F) (distinct L M) (distinct L A) (distinct L B) (distinct L C) (distinct L G) (distinct L I) (distinct L H) (distinct L E) (distinct L J)
    (distinct C K) (distinct C D) (distinct C F) (distinct C M) (distinct C A) (distinct C B) (distinct C L) (distinct C G) (distinct C I) (distinct C H) (distinct C E) (distinct C J)
    (distinct G K) (distinct G D) (distinct G F) (distinct G M) (distinct G A) (distinct G B) (distinct G L) (distinct G C) (distinct G I) (distinct G H) (distinct G E) (distinct G J)
    (distinct I K) (distinct I D) (distinct I F) (distinct I M) (distinct I A) (distinct I B) (distinct I L) (distinct I C) (distinct I G) (distinct I H) (distinct I E) (distinct I J)
    (distinct H K) (distinct H D) (distinct H F) (distinct H M) (distinct H A) (distinct H B) (distinct H L) (distinct H C) (distinct H G) (distinct H I) (distinct H E) (distinct H J)
    (distinct E K) (distinct E D) (distinct E F) (distinct E M) (distinct E A) (distinct E B) (distinct E L) (distinct E C) (distinct E G) (distinct E I) (distinct E H) (distinct E J)
    (distinct J K) (distinct J D) (distinct J F) (distinct J M) (distinct J A) (distinct J B) (distinct J L) (distinct J C) (distinct J G) (distinct J I) (distinct J H) (distinct J E)
  )

  (:goal (and
    ; Final stack bottom->top: M, L, K, J, I, H, G, F, E, D, C, B, A
    (on-table M)
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
    (top A)
  ))
)