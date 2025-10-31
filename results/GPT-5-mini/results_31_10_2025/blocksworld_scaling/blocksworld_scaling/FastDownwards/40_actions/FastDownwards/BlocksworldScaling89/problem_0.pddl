(define (problem blocks-integration)
  (:domain blocks-dual-agent)

  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    ;; typing is given by object declarations; initial stacks:
    ;; Stack1 (top to bottom): j, b, l, f, m (m on table)
    (on j b)
    (on b l)
    (on l f)
    (on f m)
    (ontable m)

    ;; Stack2 (top to bottom): k, d, e, h, a, c, g, n, i (i on table)
    (on k d)
    (on d e)
    (on e h)
    (on h a)
    (on a c)
    (on c g)
    (on g n)
    (on n i)
    (ontable i)

    ;; clear tops
    (clear j)
    (clear k)

    ;; both agents start with empty hands
    (handempty-vowel)
    (handempty-cons)
  )

  ;; Goal: single stacked tower with N on the table and A on the top.
  ;; The goal encodes the fully expanded final stack (bottom -> top):
  ;; n, m, l, f, e, d, h, c, g, k, j, i, b, a
  (:goal (and
    (ontable n)
    (on m n)
    (on l m)
    (on f l)
    (on e f)
    (on d e)
    (on h d)
    (on c h)
    (on g c)
    (on k g)
    (on j k)
    (on i j)
    (on b i)
    (on a b)
    ;; A must be the top (no block on A)
    (clear a)
  ))
)