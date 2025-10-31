(define (problem blocks_problem)
  (:domain blocks_agents)

  (:objects
    ; vowels
    a e i - vowel
    ; consonants
    b c d f g h j k - consonant
    ; table positions (three provided)
    t1 t2 t3 - table
  )

  (:init
    ; Initial stacks as provided (bottom-to-top):
    ; Stack1 (t1): B A E F C
    (on b t1)
    (on a b)
    (on e a)
    (on f e)
    (on c f)

    ; Stack2 (t2): G I J D K
    (on g t2)
    (on i g)
    (on j i)
    (on d j)
    (on k d)

    ; Stack3 (t3): H
    (on h t3)

    ; Clear/top facts (tops of each stack initially)
    (clear c)
    (clear k)
    (clear h)
  )

  (:goal (and
    ; Target final stack bottom-to-top: K J I H G F E D C B A
    ; K must be on a table location; we use table t1 to express the goal table position.
    (on k t1)
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