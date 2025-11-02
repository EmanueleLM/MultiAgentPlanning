(define (problem blocks-multiagent-instance)
  (:domain blocks-multiagent)
  (:objects
    a e i j b g d f c h - block
    table - table
  )

  (:init
    ; type labels
    (is-vowel a)
    (is-vowel e)
    (is-vowel i)

    (is-consonant j)
    (is-consonant b)
    (is-consonant g)
    (is-consonant d)
    (is-consonant f)
    (is-consonant c)
    (is-consonant h)

    ; initial stacked configuration (from combined local views)
    (on a g)
    (on c a)
    (ontable e)
    (on d e)
    (on f d)
    (on h f)
    (on i h)
    (on g b)
    (on b j)
    (ontable j)

    ; clear/top facts computed from the above stacks
    (clear c)
    (clear i)

    ; both agents start with empty hands
    (v-handempty)
    (c-handempty)
  )

  (:goal
    (and
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (ontable j)
    )
  )
)