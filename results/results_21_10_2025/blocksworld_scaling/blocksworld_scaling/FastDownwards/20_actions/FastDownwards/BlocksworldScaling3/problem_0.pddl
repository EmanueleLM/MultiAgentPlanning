(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    a b c d e f g h i j k l m n - block
    table - table
  )

  (:init
    ;; I-stack (top to bottom): e on n on j on b on c on i
    (on e n)
    (on n j)
    (on j b)
    (on b c)
    (on c i)
    (on i table)

    ;; H-stack (top to bottom): a on g on d on k on h
    (on a g)
    (on g d)
    (on d k)
    (on k h)
    (on h table)

    ;; L-stack (bottom-to-top given as [L, M, F] -> bottom l, then m, then f on top)
    (on f m)
    (on m l)
    (on l table)

    ;; Clear (tops of stacks)
    (clear e)
    (clear a)
    (clear f)

    ;; Agent ownership constraints (only these blocks may be moved by the corresponding agent)
    (vowel a)
    (vowel e)

    (consonant f)
    (consonant m)
    (consonant l)
  )

  (:goal (and
    ;; Vowel agent requested: move E onto F, and move A to the table
    (on e f)
    (on a table)

    ;; Consonant agent requested sequence results: make L on M, with M (and F) on the table
    (on l m)
    (on m table)
    (on f table)
  ))
)