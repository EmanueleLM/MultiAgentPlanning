(define (problem stack-to-j-bottom)
  (:domain blocks-multiagent)

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; initial arrangement: all blocks are singletons on the table and clear
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

    ;; label classification per agents' constraints
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d)
    (consonant f) (consonant g) (consonant h) (consonant j)
  )

  (:goal (and
    ;; final single stack (bottom J on table)
    (ontable j)
    (on i j)
    (on h i)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
    ;; top should be a (clear)
    (clear a)
  ))