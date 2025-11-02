(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions (minimal; stated because some coordination details were  ;
  ; missing from agent reports):                                          ;
  ; - The table is represented by the predicate (ontable ?b). Multiple   ;
  ;   independent stacks on the table are allowed simultaneously.        ;
  ; - Moves are atomic: each action picks up exactly one top block and   ;
  ;   places it immediately (no intermediate simultaneous actions).      ;
  ; - Agents are distinguished only by the action names (vowel-... and  ;
  ;   consonant-...), and capability constraints are enforced by the     ;
  ;   (vowel ...) and (consonant ...) predicates.                       ;
  ; - It is allowed to place consonants onto vowels and vowels onto     ;
  ;   consonants for intermediate rearrangements.                        ;
  ; - Unlimited temporary table positions are implicitly supported by   ;
  ;   using (ontable ...) for any block placed on the table.            ;
  ; - No additional turn-taking protocol is encoded here; agents' moves  ;
  ;   are available whenever preconditions are satisfied.               ;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    J G E D I B F H K A C - block
  )

  (:init
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

    ; clear = top blocks only
    (clear C)
    (clear K)

    ; agent capability labels
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