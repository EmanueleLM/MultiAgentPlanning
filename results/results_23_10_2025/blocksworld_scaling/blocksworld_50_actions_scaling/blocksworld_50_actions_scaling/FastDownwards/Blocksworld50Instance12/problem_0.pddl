(define (problem blocks-final)
  (:domain blocks)
  (:objects
    A B C D E F G H I J K L M N - block
    table - table
  )

  ;; Initial state:
  ;; All blocks start on the table and are clear; the agent's hand is empty.
  (:init
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)
    (ontable L) (clear L)
    (ontable M) (clear M)
    (ontable N) (clear N)
    (handempty)
  )

  ;; Goal: final arrangement observed by the workers
  (:goal
    (and
      ;; stack 1: A (bottom on table) -> J -> H -> I -> C -> L (top)
      (ontable A)
      (on J A)
      (on H J)
      (on I H)
      (on C I)
      (on L C)

      ;; stack 2: M (bottom on table) -> E -> F -> B -> D -> N (top)
      (ontable M)
      (on E M)
      (on F E)
      (on B F)
      (on D B)
      (on N D)

      ;; stack 3: K (bottom on table) -> G (top)
      (ontable K)
      (on G K)
    )
  )
)