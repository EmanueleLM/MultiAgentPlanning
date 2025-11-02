(define (problem multi_agent_blocks_problem)
  (:domain multi_agent_blocks)
  (:objects a b c d e f g h i j)
  (:init
    ;; blocks
    (block a) (block b) (block c) (block d) (block e) (block f) (block g) (block h) (block i) (block j)

    ;; agent capabilities
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g) (consonant h) (consonant j)

    ;; public initial configuration
    (on c j)
    (on e c)
    (on h e)
    (on a h)
    (on f d)
    (on g f)
    (on b g)

    (ontable d)
    (ontable j)
    (ontable i)

    ;; clear (top) blocks
    (clear a)
    (clear b)
    (clear i)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (ontable j)
  ))
)