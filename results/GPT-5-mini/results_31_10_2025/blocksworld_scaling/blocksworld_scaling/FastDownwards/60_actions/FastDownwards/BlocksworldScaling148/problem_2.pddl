(define (problem blocksworld_scaling148-problem)
  (:domain blocksworld_scaling148)
  (:objects
    a e i - vowel
    l m n k g b h c j d f - consonant
  )

  (:init
    ;; initial stacks:
    ;; stack1: bottom l, then e, then c (top)
    (ontable l)
    (on e l)
    (on c e)

    ;; stack2: bottom m, then k, then b, then j, then d, then f (top)
    (ontable m)
    (on k m)
    (on b k)
    (on j b)
    (on d j)
    (on f d)

    ;; stack3: bottom n, then i, then g, then h, then a (top)
    (ontable n)
    (on i n)
    (on g i)
    (on h g)
    (on a h)

    ;; clear (tops of each initial stack)
    (clear c)
    (clear f)
    (clear a)
  )

  (:goal
    (and
      ;; final single long stack n (on table) up to a (top)
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
    )
  )
)