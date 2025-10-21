(define (problem build-target-tower)
  (:domain blocksworld-multiagent)
  (:objects
    f h a m j l g d e c k b i n - block
  )

  (:init
    ;; initial table bases (bottom of stacks)
    (ontable f)
    (ontable j)
    (ontable h)

    ;; Stack 1: [F, L, D] bottom-to-top: f on table, l on f, d on l
    (on l f)
    (on d l)

    ;; Stack 2: [J, E, K, B, N] bottom-to-top: j on table, e on j, k on e, b on k, n on b
    (on e j)
    (on k e)
    (on b k)
    (on n b)

    ;; Stack 3: [H, A, M, G, C, I] bottom-to-top: h on table, a on h, m on a, g on m, c on g, i on c
    (on a h)
    (on m a)
    (on g m)
    (on c g)
    (on i c)

    ;; Clear: the top blocks of each stack initially
    (clear d)
    (clear n)
    (clear i)

    ;; Type classification (vowel / consonant)
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant f)
    (consonant h)
    (consonant m)
    (consonant j)
    (consonant l)
    (consonant g)
    (consonant d)
    (consonant c)
    (consonant k)
    (consonant b)
    (consonant n)
  )

  (:goal (and
    ;; Final single tower (bottom to top): N, M, L, K, J, I, H, G, F, E, D, C, B, A
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