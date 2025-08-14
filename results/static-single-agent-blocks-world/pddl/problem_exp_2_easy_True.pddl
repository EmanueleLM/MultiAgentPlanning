(define (problem blockworld-goal)
  (:domain blocks)

  (:objects
    A B C D E  - block)

  (:init
    ;  Every block is on the table and clear
    (on A table)   (clear A)
    (on B table)   (clear B)
    (on C table)   (clear C)
    (on D table)   (clear D)
    (on E table)   (clear E)

    ;  The hand is empty – nothing is being held
    (handempty)
  )

  (:goal
    (and
      ;; A is on the table
      (on A table)

      ;; B is on top of A and is clear
      (on B A) (clear B)

      ;; C is on the table
      (on C table)

      ;; D is on the table and is clear
      (on D table) (clear D)

      ;; E is on top of C and is clear
      (on E C) (clear E)
    )
  )
)