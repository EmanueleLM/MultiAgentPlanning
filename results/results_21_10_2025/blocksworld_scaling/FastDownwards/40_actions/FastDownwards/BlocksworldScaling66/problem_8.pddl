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

    (on-stack h s1)
    (on-block g h)
    (on-block k g)
    (on-block b k)
    (on-block d b)
    (on-block l d)
    (on-block i l)
    (top i s1)

    (on-stack m s2)
    (on-block f m)
    (on-block a f)
    (on-block e a)
    (on-block j e)
    (on-block c j)
    (top c s2)

    (not (empty s1))
    (not (empty s2))
  )

  (:goal (and
    (on-stack m s2)
    (on-block l m)
    (on-block k l)
    (on-block j k)
    (on-block i j)
    (on-block h i)
    (on-block g h)
    (on-block f g)
    (on-block e f)
    (on-block d e)
    (on-block c d)
    (on-block b c)
    (on-block a b)
    (top a s2)
    (empty s1)
  ))
)