(define (problem blocksworld-coordinated-problem)
  (:domain blocksworld-coordinated)

  (:objects
    A B C E O - block
  )

  (:init
    (on-table A) (clear B)
    (on B A)
    (on-table C) (clear O)
    (on O C)
    (on-table E) (clear E)
    (handempty)
  )

  (:goal
    (and
      (on A B)
      (on-table B)
      (on C E)
      (on-table E)
      (on-table O)
    )
  )
)