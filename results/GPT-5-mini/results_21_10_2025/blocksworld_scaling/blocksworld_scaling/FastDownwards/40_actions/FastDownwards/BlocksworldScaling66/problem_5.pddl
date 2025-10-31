(define (problem stacking-problem)
  (:domain multiagent-blocks)

  (:objects
    s1 s2 - stack

    a b c d e f g h i j k l m - block
  )

  (:init
    (is-cons h) (is-cons g) (is-cons k) (is-cons b) (is-cons m)
    (is-cons f) (is-cons d) (is-cons l) (is-cons c) (is-cons j)
    (is-vowel a) (is-vowel e) (is-vowel i)

    (on h s1)
    (on g h)
    (on k g)
    (on b k)
    (on d b)
    (on l d)
    (on i l)
    (top i s1)

    (on m s2)
    (on f m)
    (on a f)
    (on e a)
    (on j e)
    (on c j)
    (top c s2)
  )

  (:goal (and
    (on m s2)
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
    (top a s2)
    (empty s1)
  ))