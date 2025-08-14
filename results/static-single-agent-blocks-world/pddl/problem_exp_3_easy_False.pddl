(define (problem blockworld-problem)
  (:domain blockworld)

  (:objects
    A B C D E - block
  )

  (:init
    ;; Initial stack: B bottom, A on B, D on A, C on D, E on C
    (on-table B)
    (on A B)
    (on D A)
    (on C D)
    (on E C)

    (clear E)      ; only E is clear initially

    (handempty)    ; hand is free
  )

  (:goal
    (and
      ;; Every block must be on the table
      (on-table A)
      (on-table B)
      (on-table C)
      (on-table D)
      (on-table E)

      ;; Every block must be clear
      (clear A)
      (clear B)
      (clear C)
      (clear D)
      (clear E)
    )
  )
)