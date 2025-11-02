(define (problem assemble-single-chain)
  (:domain multiagent-blocksworld)
  (:objects
    a b c d e f g h i j k l m n - block
  )
  (:init
    ;; type markers
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
    (consonant m)
    (consonant n)

    ;; initial stacking (as reported)
    ;; Stack: J (table) <- F <- K  〈K top〉
    (ontable j)
    (on f j)
    (on k f)

    ;; Stack: L (table) <- G <- M <- E <- H  〈H top〉
    (ontable l)
    (on g l)
    (on m g)
    (on e m)
    (on h e)

    ;; Stack: I (table) <- D 〈D top〉
    (ontable i)
    (on d i)

    ;; Stack: B (table) <- C <- N <- A 〈A top〉
    (ontable b)
    (on c b)
    (on n c)
    (on a n)

    ;; top/clear facts (blocks that are currently top of their stack)
    (clear k)
    (clear h)
    (clear d)
    (clear a)
  )

  (:goal (and
    ;; Goal chain given exactly:
    ;; A on B, B on C, C on D, D on E, E on F, F on G, G on H,
    ;; H on I, I on J, J on K, K on L, L on M, M on N, N on table.
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j k)
    (on k l)
    (on l m)
    (on m n)
    (ontable n)
  ))
)