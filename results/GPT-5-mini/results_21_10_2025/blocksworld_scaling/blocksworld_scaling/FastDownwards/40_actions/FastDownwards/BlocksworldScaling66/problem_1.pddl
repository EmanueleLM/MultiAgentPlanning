(define (problem stacking-problem)
  (:domain multiagent-blocks)

  (:objects
    s1 s2 - stack

    H G K B M F D L A E J C I - block
  )

  (:init
    ;; block type markers
    (is-cons H) (is-cons G) (is-cons K) (is-cons B) (is-cons M)
    (is-cons F) (is-cons D) (is-cons L) (is-cons C) (is-cons J)
    (is-vowel A) (is-vowel E) (is-vowel I)

    ;; Initial Stack1 (bottom -> top): H, G, K, B, D, L, I
    (on H s1)
    (on G H)
    (on K G)
    (on B K)
    (on D B)
    (on L D)
    (on I L)
    (top I s1)

    ;; Initial Stack2 (bottom -> top): M, F, A, E, J, C
    (on M s2)
    (on F M)
    (on A F)
    (on E A)
    (on J E)
    (on C J)
    (top C s2)

    ;; Note: a stack is empty iff it has no top element; we do not assert (empty ...) for s1/s2 here.
  )

  (:goal (and
    ;; Goal: a single stack on s2 bottom->top:
    ;; M, L, K, J, I, H, G, F, E, D, C, B, A  (M on the table / s2)
    (on M s2)
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
    (top A s2)
    (empty s1)
  ))