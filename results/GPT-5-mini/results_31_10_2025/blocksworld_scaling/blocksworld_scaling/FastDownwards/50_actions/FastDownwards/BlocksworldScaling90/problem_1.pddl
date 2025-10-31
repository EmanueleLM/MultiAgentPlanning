(define (problem BlocksworldScaling90-problem)
  (:domain blocksworld-agents)

  (:objects
    a b c d e f g h i j k l m n - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; Initial stacks (bottom -> ... -> top)
    ;; stack1: [c]
    (ontable c)
    ;; stack2: [a, g, i, h, n]  (a on table, g on a, i on g, h on i, n on h)
    (ontable a)
    (on g a)
    (on i g)
    (on h i)
    (on n h)
    ;; stack3: [e, d, l, k, f]
    (ontable e)
    (on d e)
    (on l d)
    (on k l)
    (on f k)
    ;; stack4: [b, j, m]
    (ontable b)
    (on j b)
    (on m j)

    ;; Top-of-stack facts (blocks that have no block on them initially)
    (top c)
    (top n)
    (top f)
    (top m)

    ;; Both agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
    (handempty orchestrator)

    ;; Block type classification
    (is-vowel a)
    (is-vowel e)
    (is-vowel i)

    (is-consonant b)
    (is-consonant c)
    (is-consonant d)
    (is-consonant f)
    (is-consonant g)
    (is-consonant h)
    (is-consonant j)
    (is-consonant k)
    (is-consonant l)
    (is-consonant m)
    (is-consonant n)

    ;; Agent roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; Note: orchestrator is present for completeness but has no move actions
  )

  ;; Goal: the single vertical chain described in the human specification.
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
    (on j k)
    (on k l)
    (on l m)
    (on m n)
    (ontable n)
  ))
)