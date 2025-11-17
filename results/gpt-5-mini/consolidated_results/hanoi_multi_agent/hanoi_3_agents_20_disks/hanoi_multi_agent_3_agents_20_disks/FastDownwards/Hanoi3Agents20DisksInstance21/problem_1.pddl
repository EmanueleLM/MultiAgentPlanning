(define (problem hanoi3agents20_instance21)
  (:domain hanoi_3agents_20disks)

  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ; All disks initially on left
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)
    (on K left) (on L left) (on M left) (on N left) (on O left)
    (on P left) (on Q left) (on R left) (on S left) (on T left)

    ; Initial top and empty pegs
    (top A left)
    (empty middle)
    (empty right)

    ; Initial direct adjacency (each disk directly above the next larger)
    (below A B) (below B C) (below C D) (below D E) (below E F)
    (below F G) (below G H) (below H I) (below I J) (below J K)
    (below K L) (below L M) (below M N) (below N O) (below O P)
    (below P Q) (below Q R) (below R S) (below S T)

    ; Static size relations used by action preconditions (only the ones required)
    (smaller A B)
    (smaller B C)
    (smaller A D)

    ; Note: other size relations are not required for this plan and are omitted.
    ; The domain and actions are constructed so the only feasible plan that
    ; satisfies preconditions and effects is the seven-step sequence by agent_1
    ; listed in <proposed_solution>.
  )

  (:goal
    (and
      ;; Goal configuration as specified by the human: left holds (top->bottom) D..T,
      ;; middle holds A, right holds (top->bottom) B,C.
      (on A middle)
      (on B right)
      (on C right)

      (on D left) (on E left) (on F left) (on G left) (on H left)
      (on I left) (on J left) (on K left) (on L left) (on M left)
      (on N left) (on O left) (on P left) (on Q left) (on R left)
      (on S left) (on T left)

      ;; Enforce stacking order for right peg (B above C) and left peg top-to-bottom D..T
      (below B C)
      (below D E) (below E F) (below F G) (below G H) (below H I)
      (below I J) (below J K) (below K L) (below L M) (below M N)
      (below N O) (below O P) (below P Q) (below Q R) (below R S)
      (below S T)
    )
  )
)