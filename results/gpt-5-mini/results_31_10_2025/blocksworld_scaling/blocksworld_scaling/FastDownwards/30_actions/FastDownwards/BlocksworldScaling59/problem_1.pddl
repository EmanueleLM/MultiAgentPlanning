(define (problem BlocksworldScaling59-problem)
  (:domain blocksworld-multiagent)

  (:objects
    ;; two initial base places (the two bottoms that sit on the table area)
    base1 base2 - place

    ;; extra ground/table temporary spots (indexed t1..t11) used as intermediate places
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 - place

    ;; consonant blocks (per public specification)
    M G J D C H K B L F - consonant

    ;; vowel blocks (per public specification)
    A I E - vowel
  )

  (:init
    ;; Initial stacks as given (bottom-to-top):
    ;; stack 1 bottom-to-top: M, G, A, D, I, B  (M sits on base1)
    (on M base1)
    (on G M)
    (on A G)
    (on D A)
    (on I D)
    (on B I)

    ;; stack 2 bottom-to-top: J, C, H, K, E, L, F  (J sits on base2)
    (on J base2)
    (on C J)
    (on H C)
    (on K H)
    (on E K)
    (on L E)
    (on F L)

    ;; top-of-stack facts: only the top blocks are clear initially
    (clear B)
    (clear F)

    ;; all temporary ground/table spots are initially clear (available for moves)
    (clear t1) (clear t2) (clear t3) (clear t4) (clear t5)
    (clear t6) (clear t7) (clear t8) (clear t9) (clear t10) (clear t11)
  )

  ;; Goal: a single stack whose bottom is M (on base1) and then from bottom to top:
  ;; M (on base1), L on M, K on L, J on K, I on J, H on I, G on H, F on G,
  ;; E on F, D on E, C on D, B on C, A on B.
  ;; (This encodes the public target order; base1 represents the table location for M.)
  (:goal (and
    (on M base1)
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
    ;; top block should be clear in the goal
    (clear A)
  ))
)