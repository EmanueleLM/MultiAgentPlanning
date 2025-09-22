(define (problem multiagent-tower-a-to-o)
  (:domain multiagent-vowel-consonant)
  (:objects
    a e i o - vowel
    f b c m d n k h l j g - consonant
  )

  (:init
    ;; initial table positions
    (ontable e)
    (ontable o)

    ;; stacks as given (on <top> <below>)
    (on f o)
    (on b f)
    (on c b)
    (on i c)
    (on d i)
    (on h d)
    (on l h)
    (on j l)

    (on m e)
    (on n m)
    (on k n)
    (on a k)
    (on g a)

    ;; clear (tops)
    (clear j)
    (clear g)
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
    (on j k)
    (on k l)
    (on l m)
    (on m n)
    (on n o)
    (ontable o)
  ))
)