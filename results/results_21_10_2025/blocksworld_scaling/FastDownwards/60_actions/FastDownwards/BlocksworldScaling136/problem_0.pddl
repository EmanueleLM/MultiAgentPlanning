(define (problem two-stacks-to-one)
  (:domain multiagent-blocks)
  (:objects
    a e - block
    b c d - block
    table1 table2 - table
  )

  (:init
    ;; Initial two stacks:
    ;; Stack on table1: a (top) on b on c on table1
    (on a b)
    (on b c)
    (on c table1)

    ;; Stack on table2: e (top) on d on table2
    (on e d)
    (on d table2)

    ;; Clear predicates: only top blocks are clear; tables are initially occupied (not clear).
    (clear a)
    (clear e)
    ;; b, c, d are not clear (implicitly false)
    ;; tables are not clear (implicitly false)

    ;; Agent permissions as hard constraints:
    (vowel a)
    (vowel e)
    (consonant b)
    (consonant c)
    (consonant d)
  )

  ;; Goal: all blocks stacked as a single stack on table1 with the specified order (bottom to top):
  ;; bottom: c on table1, then b on c, then d on b, then a on d, then e on a (top)
  (:goal (and
    (on c table1)
    (on b c)
    (on d b)
    (on a d)
    (on e a)
  ))
)