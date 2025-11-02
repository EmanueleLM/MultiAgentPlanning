(define (problem multi_agent_blocks_problem)
  (:domain multi_agent_blocks)
  (:objects
    j a g k f c h d e i b table
  )

  (:init
    ;; initial placements (combined from both agents' inputs)
    (on j table)
    (on a table)
    (on g a)
    (on k j)
    (on f k)
    (on c g)
    (on h f)
    (on d h)
    (on e c)
    (on i e)
    (on b i)

    ;; initially only top blocks are clear
    (clear d)
    (clear b)

    ;; membership: vowel agent can only move these
    (vowel a)
    (vowel e)
    (vowel i)

    ;; membership: consonant agent can only move these
    (consonant j)
    (consonant g)
    (consonant k)
    (consonant f)
    (consonant c)
    (consonant h)
    (consonant d)
    (consonant b)
  )

  ;; global goal: build the specified tower
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
    (on k table)
  ))
)