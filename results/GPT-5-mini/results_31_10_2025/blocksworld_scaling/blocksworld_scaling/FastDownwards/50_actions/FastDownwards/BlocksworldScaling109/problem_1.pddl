(define (problem rearrange-multiagent)
  (:domain blocks-multiagent)
  (:objects
    a e i - vowel
    b c d f g h j k - consonant
  )

  (:init
    ;; Initial stacks (from the human specification):
    ;; Stack 1: C (table) -> A -> K(top)
    (ontable c)
    (on a c)
    (on k a)

    ;; Stack 2: J (table) -> E -> B -> H -> G(top)
    (ontable j)
    (on e j)
    (on b e)
    (on h b)
    (on g h)

    ;; Stack 3: F (table) -> D -> I(top)
    (ontable f)
    (on d f)
    (on i d)

    ;; Clear predicate for top blocks
    (clear k)
    (clear g)
    (clear i)
  )

  ;; Goal: final linear stack (encoded exactly as required by the human specification).
  (:goal (and
    (on a b)    ;; A on B
    (on b c)    ;; B on C
    (on c d)    ;; C on D
    (on d e)    ;; D on E
    (on e f)    ;; E on F
    (on f g)    ;; F on G
    (on g h)    ;; G on H
    (on h i)    ;; H on I
    (on i j)    ;; I on J
    (on j k)    ;; J on K
    (ontable k) ;; K on table (base)
  ))
)