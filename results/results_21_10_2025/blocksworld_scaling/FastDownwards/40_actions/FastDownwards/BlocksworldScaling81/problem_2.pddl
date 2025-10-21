(define (problem BlocksworldScaling81-problem)
  (:domain blocksworld-multiagent)
  (:objects
    a e i o - vowel
    m g j d h f n c k l b - consonant
  )
  (:init
    ;; Initial stacks (as specified):
    ;; Stack1 (table): m (on table) - j - d - n - c - o (top)
    (ontable m)
    (on j m)
    (on d j)
    (on n d)
    (on c n)
    (on o c)

    ;; Stack2 (table): g (on table) - e - a - h - f - k - l - b - i (top)
    (ontable g)
    (on e g)
    (on a e)
    (on h a)
    (on f h)
    (on k f)
    (on l k)
    (on b l)
    (on i b)

    ;; Clear (top) facts: initially o and i are the only tops
    (clear o)
    (clear i)
  )
  (:goal (and
    (ontable o)
    (on n o)
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