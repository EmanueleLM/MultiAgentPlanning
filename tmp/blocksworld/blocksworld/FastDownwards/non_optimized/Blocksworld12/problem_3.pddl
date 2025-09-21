(define (problem multi_agent_stack_problem)
  (:domain multi_agent_blocks)
  (:objects
    a b c d e f g h i j
    vowel_agent conjugate_consonant_unused consonant_agent orchestrator
  )

  (:init
    (block a) (block b) (block c) (block d) (block e) (block f) (block g) (block h) (block i) (block j)

    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g) (consonant h) (consonant j)

    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)
    (orchestrator orchestrator)

    (ontable h)
    (on d h)
    (on a d)
    (on c a)

    (ontable j)
    (on e j)
    (on f e)
    (on i f)
    (on g i)
    (on b g)

    (clear c)
    (clear b)
  )

  (:goal
    (and
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