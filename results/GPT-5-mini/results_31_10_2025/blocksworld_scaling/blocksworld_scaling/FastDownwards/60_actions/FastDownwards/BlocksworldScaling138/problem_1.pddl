(define (problem build-tower)
  (:domain multiagent-blocks)

  (:objects
    K C D M F H A E L I J G B - block
    s1 s2 s3 s4 s5 s6 - place
  )

  (:init
    ;; Agent capability classification
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

    ;; Initial stacks (bottom-to-top)
    ;; Stack s1: K (onplace), F on K, J on F, B on J
    (onplace K s1)
    (on F K)
    (on J F)
    (on B J)

    ;; Stack s2: C on table
    (onplace C s2)

    ;; Stack s3: D onplace, E on D, I on E
    (onplace D s3)
    (on E D)
    (on I E)

    ;; Stack s4: M onplace, H on M, A on H, L on A, G on L
    (onplace M s4)
    (on H M)
    (on A H)
    (on L A)
    (on G L)

    ;; Initially free places
    (clear s5)
    (clear s6)

    ;; Tops of stacks are clear
    (clear B)
    (clear C)
    (clear I)
    (clear G)
  )

  (:goal
    (and
      ;; Desired single tower with M on table s4 and the required order
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