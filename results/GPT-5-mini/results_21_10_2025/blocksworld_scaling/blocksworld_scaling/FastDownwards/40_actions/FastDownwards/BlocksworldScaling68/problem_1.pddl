; Problem: Build a single stack with J on the table and A on top of B, B on C, C on D,
; D on E, E on F, F on G, G on H, H on I, I on J.
; Assumptions / notes:
; - The orchestrator assumes a single, unconstrained table surface that can host multiple stacks.
; - Agents act sequentially in this model; concurrency is not modelled. The domain prevents illegal moves:
;   vowels (A,E,I) can only be moved by vowel-* actions; consonants by cons-* actions.
; - Initial stacks follow the provided JSON: stack1 bottom-to-top C,F,H,J and stack2 bottom-to-top B,G,E,A,I,D.
(define (problem build-stack)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; type classification
    (vowel A)
    (vowel E)
    (vowel I)

    (cons B)
    (cons C)
    (cons D)
    (cons F)
    (cons G)
    (cons H)
    (cons J)

    ;; initial stacks (from JSON: stack1 = C-F-H-J, stack2 = B-G-E-A-I-D)
    ;; stack1: C bottom on table, F on C, H on F, J on H
    (ontable C)
    (on F C)
    (on H F)
    (on J H)

    ;; stack2: B bottom on table, G on B, E on G, A on E, I on A, D on I
    (ontable B)
    (on G B)
    (on E G)
    (on A E)
    (on I A)
    (on D I)

    ;; clear = only true for blocks that are currently top of a stack
    (clear J)
    (clear D)

    ;; both agents' hands empty at start
    (handempty-vowel)
    (handempty-cons)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)
  ))
)