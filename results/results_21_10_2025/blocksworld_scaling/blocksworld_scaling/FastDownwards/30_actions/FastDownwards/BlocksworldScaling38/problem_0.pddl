(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)

  (:objects
    A E I - vowel
    B C D G J L K F H - consonant
    ;; all are blocks via typing
  )

  (:init
    ;; Stack1: B (table), I on B, C on I, D on C, G on D, J on G, L on J
    (ontable B)
    (on I B)
    (on C I)
    (on D C)
    (on G D)
    (on J G)
    (on L J)

    ;; Stack2: E (table), H on E, A on H
    (ontable E)
    (on H E)
    (on A H)

    ;; Stack3: K (table), F on K
    (ontable K)
    (on F K)

    ;; Clear (tops)
    (clear L)
    (clear A)
    (clear F)

    ;; No consonant is initially marked ready for vowel placement
    ;; (ready-for-vowel ...) are absent by default
  )

  (:goal (and
    ;; final tower bottom->top: L K J I H G F E D C B A
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
  ))
)