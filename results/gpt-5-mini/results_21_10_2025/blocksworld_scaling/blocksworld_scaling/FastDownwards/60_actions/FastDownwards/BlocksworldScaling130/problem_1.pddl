(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    a e i - vowel
    b c d f g h j k l - consonant
    table - table
  )

  ;; Initial configuration (on block/place). Table is a place; blocks on table use 'table'.
  ;; Stacks (bottom -> top):
  ;; S1: table - i - e - b - a - j - c
  ;; S2: table - h - l
  ;; S3: table - f - k - d - g

  (:init
    ;; S1
    (on i table)
    (on e i)
    (on b e)
    (on a b)
    (on j a)
    (on c j)

    ;; S2
    (on h table)
    (on l h)

    ;; S3
    (on f table)
    (on k f)
    (on d k)
    (on g d)

    ;; clear facts for current top blocks
    (clear c)
    (clear l)
    (clear g)
  )

  ;; Goal: L on table, K on L, J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
  ;; (This encodes the final stacking configuration described in the specification.)
  (:goal
    (and
      (on l table)
      (on k l)
      (on j k)
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