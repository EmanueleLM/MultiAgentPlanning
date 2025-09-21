(define (problem multi_agent_stack_problem)
  (:domain multi_agent_blocks)
  (:objects
    a b c d e f g h i j table
  )

  (:init
    ;; declare which are blocks (table is not a block)
    (block a) (block b) (block c) (block d) (block e) (block f) (block g) (block h) (block i) (block j)

    ;; declare vowel / consonant classification (as agreed by agents)
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g) (consonant h) (consonant j)

    ;; initial stacking (public information)
    ;; Stack 1: H on table, D on H, A on D, C on A
    (ontable h)
    (on h table)
    (on d h)
    (on a d)
    (on c a)

    ;; Stack 2: J on table, E on J, F on E, I on F, G on I, B on G
    (ontable j)
    (on j table)
    (on e j)
    (on f e)
    (on i f)
    (on g i)
    (on b g)

    ;; clear = top of each stack (blocks with nothing on top)
    (clear c)
    (clear b)
  )

  (:goal
    (and
      ;; desired single stack: J on table, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
      (ontable j)
      (on i j)
      (on h i)
      (on g h)
      (on f g)
      (on e f)
      (on d e)
      (on c d)
      (on b c)
      (on a b)
    )
  )
)