(define (problem BlocksworldScaling140-problem)
  (:domain blocks-multiagent)

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; initial stacks:
    ;; stack on table D: D - A - H - G - J - F  (F is top)
    (ontable d)
    (on a d)
    (on h a)
    (on g h)
    (on j g)
    (on f j)

    ;; stack on table C: C - I - B - E  (E is top)
    (ontable c)
    (on i c)
    (on b i)
    (on e b)

    ;; clear (top blocks)
    (clear f)
    (clear e)

    ;; blocks that are on the table are not also on another block (explicit)
    ;; (ontable d) and (ontable c) already set; others are on blocks.

    ;; agent capabilities (classification)
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d)
    (consonant f) (consonant g) (consonant h) (consonant j)
  )

  (:goal (and
    ;; final single stack bottom-up: J (on table), I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
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
    ;; ensure top is clear
    (clear a)
  ))
)