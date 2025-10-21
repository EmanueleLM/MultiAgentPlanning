(define (problem blocks-multi-agent-problem)
  (:domain blocks-multi-agent)

  (:objects
    a b c d e f g h i j k l m n o - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; agents
    (agent vowel_agent)
    (agent consonant_agent)
    (agent orchestrator)

    ;; agent capabilities
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; hand states (both agents start with empty hands)
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; block classifications (vowels and consonants)
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

    ;; initial on-table bottoms
    (ontable e)
    (ontable o)

    ;; stack on o: o - f - b - c - i - d - h - l - j  (o bottom, j top)
    (on f o)
    (on b f)
    (on c b)
    (on i c)
    (on d i)
    (on h d)
    (on l h)
    (on j l)

    ;; stack on e: e - m - n - k - a - g  (e bottom, g top)
    (on m e)
    (on n m)
    (on k n)
    (on a k)
    (on g a)

    ;; clear tops of stacks
    (clear j)
    (clear g)
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
    (ontable o)
  ))
)