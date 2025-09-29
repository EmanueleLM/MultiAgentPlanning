(define (problem multi-agent-stacks-problem)
  (:domain multi-agent-stacks)
  (:objects
    a b c d e f g h i j k table
  )

  (:init
    ;; initial on relationships (normalized to lowercase)
    (on j table)
    (on a table)
    (on g a)
    (on k j)
    (on f k)
    (on c g)
    (on h f)
    (on d h)
    (on e c)
    (on i e)
    (on b i)

    ;; clear: tops of stacks
    (clear b)
    (clear d)

    ;; agent knowledge: vowel and consonant membership
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant j)
    (consonant g)
    (consonant k)
    (consonant f)
    (consonant c)
    (consonant h)
    (consonant d)
    (consonant b)
  )

  ;; Orchestrator goal: final stack a on b on c ... on k on table
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
    (on k table)
  ))
)