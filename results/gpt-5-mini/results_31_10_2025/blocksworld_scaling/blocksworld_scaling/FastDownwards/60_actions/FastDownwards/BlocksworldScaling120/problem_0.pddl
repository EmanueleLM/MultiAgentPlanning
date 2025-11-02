(define (problem blocks_problem)
  (:domain blocks_agents)

  (:objects
    ; vowels
    a e i - vowel
    ; consonants
    b c d f g h j k - consonant
    ; tables (exactly the three table locations provided in observations)
    t1 t2 t3 - table
  )

  (:init
    ; Stack1 bottom-to-top: B, A, E, F, C on table t1
    (on b t1)
    (on a b)
    (on e a)
    (on f e)
    (on c f)

    ; Stack2 bottom-to-top: G, I, J, D, K on table t2
    (on g t2)
    (on i g)
    (on j i)
    (on d j)
    (on k d)

    ; Stack3 (only top known): H on table t3 (treat as single-block stack)
    (on h t3)

    ; clear (tops observed): C, K, H are tops
    (clear c)
    (clear k)
    (clear h)
  )

  (:goal (and
    ; Goal stack (bottom-to-top): K J I H G F E D C B A with K on the table (use t1 as the table location for the goal)
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