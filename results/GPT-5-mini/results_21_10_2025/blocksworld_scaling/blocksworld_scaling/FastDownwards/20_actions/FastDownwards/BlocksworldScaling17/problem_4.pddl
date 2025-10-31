(define (problem BlocksworldScaling17-instance)
  (:domain multiagent-blocksworld)
  (:objects
    a b c d e f g h i j k l m n - block
  )

  (:init
    ;; Type markers
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

    ;; Initial stacking exactly as given:
    ;; Stack: J (table) <- F <- K   (K top)
    (ontable j)
    (on f j)
    (on k f)

    ;; Stack: L (table) <- G <- M <- E <- H   (H top)
    (ontable l)
    (on g l)
    (on m g)
    (on e m)
    (on h e)

    ;; Stack: I (table) <- D   (D top)
    (ontable i)
    (on d i)

    ;; Stack: B (table) <- C <- N <- A   (A top)
    (ontable b)
    (on c b)
    (on n c)
    (on a n)

    ;; Top/clear facts (blocks that are currently top of their stacks)
    (clear k)
    (clear h)
    (clear d)
    (clear a)
  )

  (:goal (and
    ;; Goal chain: A on B, B on C, C on D, D on E, E on F, F on G, G on H,
    ;; H on I, I on J, J on K, K on L, L on M, M on N, and N on the table.
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
  )))