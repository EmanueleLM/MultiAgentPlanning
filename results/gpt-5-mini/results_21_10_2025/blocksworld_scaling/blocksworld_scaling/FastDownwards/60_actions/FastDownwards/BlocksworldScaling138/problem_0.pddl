(define (problem build-tower)
  (:domain multiagent-blocks)

  (:objects
    K C D M F H A E L I J G B - block
    s1 s2 s3 s4 s5 s6 - place
  )

  (:init
    ;; Vowel and consonant classifications (agent capabilities)
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
    (consonant M)

    ;; Initial stack configuration (as given). Stacks are places s1..s6.
    ;; Stack 1 bottom-to-top: K, F, J, B
    (onplace K s1)
    (on F K)
    (on J F)
    (on B J)

    ;; Stack 2: C on the table (s2)
    (onplace C s2)

    ;; Stack 3 bottom-to-top: D, E, I
    (onplace D s3)
    (on E D)
    (on I E)

    ;; Stack 4 bottom-to-top: M, H, A, L, G
    (onplace M s4)
    (on H M)
    (on A H)
    (on L A)
    (on G L)

    ;; Places s5 and s6 are initially empty (clear). Other occupied places are not listed as clear.
    (clear s5)
    (clear s6)

    ;; Top blocks of occupied stacks are clear
    (clear B)
    (clear C)
    (clear I)
    (clear G)
  )

  (:goal
    (and
      ;; The goal chain: A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on I, I on J, J on K, K on L, L on M, and M on the table (place s4)
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
      (on K L)
      (on L M)
      (onplace M s4)
    )
  )
)