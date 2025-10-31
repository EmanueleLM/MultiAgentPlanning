(define (problem rearrange-multiagent)
  (:domain blocks-multiagent)
  (:objects
    a e i - vowel
    b c d f g h j k - consonant
  )

  (:init
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

    ;; Clear (top) blocks
    (clear k)
    (clear g)
    (clear i)
  )

  ;; Integrated target configuration derived from agents' plans and constraints:
  ;; - Vowel placements required by the vowel agent: I -> J, E -> F, A -> B
  ;; - Consonant scaffolding recommended by the consonant agent: J -> K, K on table
  ;; - Consonant D must be placed on E (D on E) as stated in the reports.
  ;; These are encoded as hard constraints (goals).
  (:goal (and
    (on i j)    ;; I on J
    (on e f)    ;; E on F
    (on d e)    ;; D on E
    (on a b)    ;; A on B
    (on j k)    ;; J on K
    (ontable k) ;; K on table (base for J)
  ))
)