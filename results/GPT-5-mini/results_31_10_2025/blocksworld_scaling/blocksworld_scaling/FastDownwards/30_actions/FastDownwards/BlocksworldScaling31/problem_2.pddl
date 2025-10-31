(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    ;; Stack 1 (table -> top): k - h - n - e - m - g - c - f - d
    (ontable k)
    (on h k)
    (on n h)
    (on e n)
    (on m e)
    (on g m)
    (on c g)
    (on f c)
    (on d f)

    ;; Stack 2 (table -> top): j - b - i - a - l
    (ontable j)
    (on b j)
    (on i b)
    (on a i)
    (on l a)

    ;; Clear/top facts: only tops initially are d and l
    (clear d)
    (clear l)
  )

  (:goal (and
    ;; target single stack (table -> top): n - m - l - k - j - i - h - g - f - e - d - c - b - a
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