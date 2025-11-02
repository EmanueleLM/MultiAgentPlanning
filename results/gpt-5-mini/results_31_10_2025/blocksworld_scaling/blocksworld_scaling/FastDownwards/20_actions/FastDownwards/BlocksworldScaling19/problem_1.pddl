(define (problem make-stack-N-bottom-A-top)
  (:domain multi-agent-blocks)
  (:objects
    a b c d e f g h i j k l m n - block
  )
  (:init
    ;; Table bottoms
    (ontable l)
    (ontable n)

    ;; Stack 1: l - d - g - f - c - i - e - k - h - m  (bottom->top)
    (on d l)
    (on g d)
    (on f g)
    (on c f)
    (on i c)
    (on e i)
    (on k e)
    (on h k)
    (on m h)

    ;; Stack 2: n - j - a - b (bottom->top)
    (on j n)
    (on a j)
    (on b a)

    ;; Only top blocks are clear initially
    (clear m)
    (clear b)

    ;; Agent hand states
    (handempty-vowel)
    (handempty-consonant)

    ;; Label vowels and consonants
    (vowel a)
    (vowel e)
    (vowel i)
    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
    (consonant m)
    (consonant n)
  )
  (:goal (and
    ;; Desired single stack bottom->top: n m l k j i h g f e d c b a
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
    (clear a)
  ))
)