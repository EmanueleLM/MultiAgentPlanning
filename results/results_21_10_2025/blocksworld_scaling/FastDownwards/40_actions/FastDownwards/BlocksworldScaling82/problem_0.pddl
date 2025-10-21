(define (problem stack-a-on-b-on-c-on-d-on-e-on-f-on-g-on-h-on-i-on-j)
  (:domain blocksworld-multiagent)

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; All blocks start on the table and are clear (no block on top)
    (ontable a) (clear a)
    (ontable b) (clear b)
    (ontable c) (clear c)
    (ontable d) (clear d)
    (ontable e) (clear e)
    (ontable f) (clear f)
    (ontable g) (clear g)
    (ontable h) (clear h)
    (ontable i) (clear i)
    (ontable j) (clear j)

    ;; Hands empty for both agents
    (handempty_vowel)
    (handempty_consonant)

    ;; Vowel / consonant classification (strict constraints)
    (is_vowel a) (is_vowel e) (is_vowel i)
    (is_consonant b) (is_consonant c) (is_consonant d)
    (is_consonant f) (is_consonant g) (is_consonant h) (is_consonant j)
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