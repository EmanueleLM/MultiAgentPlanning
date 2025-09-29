(define (problem integrated_multiagent_problem)
  (:domain multiagent_blocks)
  (:objects
    a b c d e f g h i j k l - block
  )

  (:init
    ;; Static classifications (from agents' inputs)
    (vowel a) (vowel e) (vowel i)
    (consonant c) (consonant d) (consonant l) (consonant k)
    (consonant h) (consonant f) (consonant g) (consonant j) (consonant b)

    ;; Initial table positions and stack relations (merged from both agents)
    ;; Stack 1: table - a - i - l - k - e - f (f is top)
    (ontable a)
    (on i a)
    (on l i)
    (on k l)
    (on e k)
    (on f e)

    ;; Stack 2: table - c - d - h - g - j - b (b is top)
    (ontable c)
    (on d c)
    (on h d)
    (on g h)
    (on j g)
    (on b j)

    ;; Clear (tops of stacks)
    (clear f)
    (clear b)

    ;; Two agents start with empty hands
    (handempty_v)
    (handempty_c)
  )

  (:goal (and
    ;; Desired final stack: a on b on c on d on e on f on g on h on i on j on k on l; l on table.
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
    (ontable l)
  ))
)