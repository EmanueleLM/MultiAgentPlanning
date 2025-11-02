(define (problem stacking-multiagent)
  (:domain blocks-multiagent)
  (:objects
    ;; blocks (lowercase identifiers)
    k f a d i j b h g c e - block
    ;; single table support object
    table-surface - support
    ;; agents
    vowel_agent1 - vowel_agent
    consonant_agent1 - consonant_agent
  )

  (:init
    ;; initial supports: two stacks
    ;; Stack1 bottom->top: K (on table), A on K, J on A, B on J, G on B
    (ontable k)
    (on a k)
    (on j a)
    (on b j)
    (on g b)

    ;; Stack2 bottom->top: F (on table), D on F, I on D, H on I, C on H, E on C
    (ontable f)
    (on d f)
    (on i d)
    (on h i)
    (on c h)
    (on e c)

    ;; clear (top blocks)
    (clear g)
    (clear e)

    ;; type classification of blocks by label
    (is-vowel a)
    (is-vowel e)
    (is-vowel i)

    (is-consonant k)
    (is-consonant f)
    (is-consonant d)
    (is-consonant j)
    (is-consonant b)
    (is-consonant h)
    (is-consonant g)
    (is-consonant c)

    ;; note: table-surface is a support but we model table placements using 'ontable' predicates
    ;; no explicit (clear table-surface) needed because ontable handles table membership
  )

  (:goal (and
    ;; final single chain: top A down to base K on table
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
    (ontable k)
  ))
)