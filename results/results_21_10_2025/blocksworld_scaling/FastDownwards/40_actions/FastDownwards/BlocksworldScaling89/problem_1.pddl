(define (problem blocksworld-scaling89-problem)
  (:domain blocksworld-scaling89)

  (:objects
    a e i - vowel
    b c d f g h j k l m n - consonant
  )

  (:init
    ;; Initial stacks as given (bottom -> top)
    ;; Stack1: M F L B J  (M on table)
    (on j b)
    (on b l)
    (on l f)
    (on f m)
    (ontable m)

    ;; Stack2: I N G C A H E D K  (I on table)
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

  ;; Goal: single stacked tower with N on the table and A on the top,
  ;; matching the target ordering bottom -> top:
  ;; N M L K J I H G F E D C B A
  (:goal (and
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
    ;; ensure A is the top
    (clear a)
  ))
)