(define (problem multi-agent-blocks-problem)
  (:domain multi-agent-blocks)

  (:objects
    a b c d e f g h i j k - block
    table - place
  )

  ;; Initial configuration (as provided). Two stacks:
  ;; Stack A: a (base on table) -> g -> c -> e -> i -> b (top)
  ;; Stack J: j (base on table) -> k -> f -> h -> d (top)
  (:init
    ;; ownership / control of blocks (hard constraints)
    (vowel a)
    (vowel e)
    (vowel i)
    ;; Note: O and U are not present among objects; they are not included.
    (consonant j)
    (consonant g)
    (consonant k)
    (consonant f)
    (consonant c)
    (consonant h)
    (consonant d)
    (consonant b)

    ;; On / ontable relations (initial state)
    (ontable j)
    (ontable a)

    (on k j)
    (on f k)
    (on h f)
    (on d h)

    (on g a)
    (on c g)
    (on e c)
    (on i e)
    (on b i)

    ;; Clear predicates: only the top blocks are clear
    (clear d)
    (clear b)

    ;; Implicit: all other clear/on/ontable facts not listed are false
  )

  ;; Goal: build the tower A on B on C ... on K on table
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
    (ontable k)
  ))
)