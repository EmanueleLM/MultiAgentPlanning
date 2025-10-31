(define (problem BlocksworldScaling92-problem)
  (:domain multiagent-blocks)
  (:objects
    a b c d e f g h i j k l m n o - block
    table - place
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    (istable table)

    ;; Stack 1: D (bottom) - O - E (top)
    (on d table)
    (on o d)
    (on e o)

    ;; Stack 2: N - M - H - F - J - B - C (C top)
    (on n table)
    (on m n)
    (on h m)
    (on f h)
    (on j f)
    (on b j)
    (on c b)

    ;; Stack 3: A - K - G - L (L top)
    (on a table)
    (on k a)
    (on g k)
    (on l g)

    ;; Stack 4: I on table (single)
    (on i table)

    ;; clear: top blocks are clear initially
    (clear e)
    (clear c)
    (clear l)
    (clear i)

    ;; agents' hands empty
    (handempty vowel_agent)
    (handempty consonant_agent)
    (handempty orchestrator)

    ;; agent roles
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)

    ;; vowel/consonant classification
    (vowel a)
    (vowel e)
    (vowel i)
    (vowel o)

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
    (on j k)
    (on k l)
    (on l m)
    (on m n)
    (on n o)
    (on o table)
  ))
)