(define (problem build-stack-n-to-a)
  (:domain blocks-multiagent)

  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    ;; Initial stacks (bottom-to-top): [L, E, I, K], [M, F, H, J, N], [C], [G, A, B, D]
    ;; Stack 1: l is on table, e on l, i on e, k on i
    (ontable l)
    (on e l)
    (on i e)
    (on k i)

    ;; Stack 2: m on table, f on m, h on f, j on h, n on j
    (ontable m)
    (on f m)
    (on h f)
    (on j h)
    (on n j)

    ;; Stack 3: c on table
    (ontable c)

    ;; Stack 4: g on table, a on g, b on a, d on b
    (ontable g)
    (on a g)
    (on b a)
    (on d b)

    ;; Clear = top of each stack
    (clear k)
    (clear n)
    (clear c)
    (clear d)

    ;; single shared hand is initially empty
    (handempty)
  )

  (:goal (and
    ;; Desired final tower order bottom-to-top: n, m, l, k, j, i, h, g, f, e, d, c, b, a
    (ontable n)
    (on m n)
    (on l m)
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
  ))
)