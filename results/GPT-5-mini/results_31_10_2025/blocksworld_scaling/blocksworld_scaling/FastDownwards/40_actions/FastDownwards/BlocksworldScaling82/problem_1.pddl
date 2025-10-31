(define (problem stack-a-on-b-on-c-on-d-on-e-on-f-on-g-on-h-on-i-on-j)
  (:domain blocksworld-multiagent)

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; initial table bases
    (ontable g)
    (ontable b)
    (ontable c)

    ;; initial stacked relations (top-of-stack relations)
    (on f g)
    (on a f)

    (on i b)
    (on e i)

    (on h c)
    (on j h)
    (on d j)

    ;; which blocks are clear (topmost blocks)
    (clear a)
    (clear e)
    (clear d)

    ;; both agents start with empty hands
    (handempty_vowel)
    (handempty_consonant)

    ;; classification of blocks by agent capability
    (is_vowel a) (is_vowel e) (is_vowel i)
    (is_consonant b) (is_consonant c) (is_consonant d) (is_consonant f)
    (is_consonant g) (is_consonant h) (is_consonant j)
  )

  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (ontable j)
  ))
)