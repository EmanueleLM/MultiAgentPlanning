(define (problem multiagent-blocks-problem-explicit)
  (:domain multiagent-blocks-explicit-sequence)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions (minimal; recorded here):
  ; - The planner models multiple independent table locations by the
  ;   single predicate (ontable ?b). Any block with (ontable ?b) and
  ;   no other block on top is considered a standalone table-top stack.
  ; - The solution is encoded as a single linear, atomic sequence of
  ;   moves. To guarantee that exact valid ordering (and to enforce
  ;   agent capabilities), each move in the computed plan is represented
  ;   by a dedicated action whose preconditions and effects match the
  ;   intermediate state expected at that step.
  ; - Agents are distinguished by action name prefixes (vowel-... and
  ;   consonant-...), and capability constraints are encoded by the
  ;   (vowel ...) and (consonant ...) predicates. No other interleavings
  ;   are possible because of the step-control predicates (at-step sX).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    J G E D I B F H K A C - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 - step
  )

  (:init
    ; initial stacks as specified:
    ; stack 1 (bottom -> top): J, G, D, F, H, A, C
    (ontable J)
    (on G J)
    (on D G)
    (on F D)
    (on H F)
    (on A H)
    (on C A)

    ; stack 2 (bottom -> top): E, I, B, K
    (ontable E)
    (on I E)
    (on B I)
    (on K B)

    ; only top blocks initially are clear:
    (clear C)
    (clear K)

    ; agent capability labels (vowels and consonants)
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

    ;; step control: start at s0
    (at-step s0)
  )

  (:goal
    (and
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (ontable K)
    )
  )
)