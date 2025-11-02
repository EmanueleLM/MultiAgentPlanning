(define (problem build-tower-L-to-A)
  (:domain blocksworld-scaling88)
  (:objects
    a e i - vowel_block
    j h k c b d g l f - cons_block
  )

  (:init
    ;; Stack 1 (bottom-to-top): j a h e d l f
    (ontable j)
    (on a j)
    (on h a)
    (on e h)
    (on d e)
    (on l d)
    (on f l)

    ;; Stack 2 (bottom-to-top): k c b g i
    (ontable k)
    (on c k)
    (on b c)
    (on g b)
    (on i g)

    ;; Initially clear (tops)
    (clear f)
    (clear i)

    ;; Note: other blocks are not clear initially (implicitly)
  )

  ;; Goal: single tower with l on the table, then k on l, j on k, i on j, h on i,
  ;; g on h, f on g, e on f, d on e, c on d, b on c, a on b.
  (:goal
    (and
      (ontable l)
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