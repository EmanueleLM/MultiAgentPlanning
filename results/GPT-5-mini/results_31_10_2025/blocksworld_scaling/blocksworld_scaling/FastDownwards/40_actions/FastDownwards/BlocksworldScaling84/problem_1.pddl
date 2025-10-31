(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  ; Assumptions and notes:
  ; - There is an unbounded abstract table: any block may be placed on the table.
  ; - Only the top block of any stack (predicate (clear ?x)) may be moved.
  ; - Agents' move permissions are modelled by typing:
  ;     vowel actions accept only A, E, I (type vowel);
  ;     consonant actions accept only B C D F G H J K L M N (type consonant).
  ; - The initial stacks encode the exact public initial configuration.
  ; - The goal encodes the single tower with N on the table and the specified ordering.
  ; - This problem file includes comments describing assumptions; no other hidden assumptions were made.

  (:objects
    A E I - vowel
    B C D F G H J K L M N - consonant
  )

  (:init
    ;; Stack1: bottom B (on table), then F on B, then K on F (K top)
    (ontable B)
    (on F B)
    (on K F)

    ;; Stack2: bottom C (on table), then A on C, then L on A, then J on L,
    ;; then E on J, then H on E, then I on H (I top)
    (ontable C)
    (on A C)
    (on L A)
    (on J L)
    (on E J)
    (on H E)
    (on I H)

    ;; Stack3: bottom M (on table), then N on M, then G on N, then D on G (D top)
    (ontable M)
    (on N M)
    (on G N)
    (on D G)

    ;; clear predicates: only the three top blocks are initially clear
    (clear K)
    (clear I)
    (clear D)
  )

  (:goal (and
    (ontable N)
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
    (clear A)
  ))
)