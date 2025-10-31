(define (problem blocks-multi-agent-problem)
  (:domain blocks-multi-agent)
  (:objects
    a b c d e f g h i j k l m n o - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; agents
    (agent vowel_agent)
    (agent consonant_agent)

    ;; agent capabilities (movable block classifications)
    (vowel a)
    (vowel e)
    (vowel i)
    (vowel o)

    (consonant b)
    (consonant c)
    (consonant f)
    (consonant m)
    (consonant d)
    (consonant n)
    (consonant k)
    (consonant h)
    (consonant l)
    (consonant j)
    (consonant g)

    ;; bottoms on table
    (ontable e)
    (ontable o)

    ;; stack on o: o - f - b - c - i - d - h - l - j  (o at bottom)
    (on f o)
    (on b f)
    (on c b)
    (on i c)
    (on d i)
    (on h d)
    (on l h)
    (on j l)

    ;; stack on e: e - m - n - k - a - g  (e at bottom)
    (on m e)
    (on n m)
    (on k n)
    (on a k)
    (on g a)

    ;; clear (tops of stacks)
    (clear j)
    (clear g)
  )

  (:goal (and
    ;; desired single tower: a on b, b on c, ..., n on o, o on table
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