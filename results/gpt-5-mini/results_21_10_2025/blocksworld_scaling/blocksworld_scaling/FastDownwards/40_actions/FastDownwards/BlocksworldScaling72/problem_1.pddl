(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    a b c d e f g h i j k l m n o - block
  )
  (:init
    ;; type membership
    (vowel a) (vowel e) (vowel i) (vowel o)
    (consonant b) (consonant c) (consonant d) (consonant f)
    (consonant g) (consonant h) (consonant j) (consonant k)
    (consonant l) (consonant m) (consonant n)

    ;; initial stacks (bottom -> top)
    ;; Stack S1: g - f - j - m - o - l  (g on table)
    (ontable g)
    (on f g)
    (on j f)
    (on m j)
    (on o m)
    (on l o)

    ;; Stack S2: d - c - e  (d on table)
    (ontable d)
    (on c d)
    (on e c)

    ;; Stack S3: i - h - k - b - n - a  (i on table)
    (ontable i)
    (on h i)
    (on k h)
    (on b k)
    (on n b)
    (on a n)

    ;; clear facts for currently top blocks
    (clear l)
    (clear e)
    (clear a)
    ;; other blocks are not declared clear initially
  )

  (:goal (and
    ;; desired single chain top->...->bottom A on B on C ... on O(on table)
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