(define (problem BlocksworldScaling131-problem)
  (:domain BlocksworldScaling131)

  (:objects
    H D F G C K E A I J B - block
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 - table_spot
  )

  (:init
    ;; initial on relations (two stacks)
    (on H t1)
    (on D H)
    (on F D)
    (on K F)
    (on I K)
    (on J I)
    (on B J)

    (on G t2)
    (on C G)
    (on E C)
    (on A E)

    ;; clear facts: top blocks and unused table spots
    (clear B)
    (clear A)

    (clear t3)
    (clear t4)
    (clear t5)
    (clear t6)
    (clear t7)
    (clear t8)
    (clear t9)
    (clear t10)
    (clear t11)

    ;; type annotations for vowel / consonant permissions
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

  ;; Goal: desired final stacking A on B, B on C, ..., J on K, and K on the table (we choose t4 as the table spot for K)
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
      (on K t4)
    )
  )
)