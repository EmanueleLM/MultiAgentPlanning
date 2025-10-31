(define (problem blocksworld40-instance11-problem)
  (:domain blocksworld40-instance11)
  (:objects
    A B C D E F G H I J K - block
  )
  (:init
    ;; Initial on / on-table relationships
    (on A G)
    (on B K)
    (on K C)
    (on I B)
    (on H I)
    (on J D)
    (on E J)

    ;; Table blocks bottoms
    (on-table C)
    (on-table D)
    (on-table F)
    (on-table G)

    ;; Clear (top-of-stack) initially: H, E, A, F are tops
    (clear H)
    (clear E)
    (clear A)
    (clear F)

    ;; Blocks that are not clear are not listed as clear (implicitly)
    ;; Hand is empty initially
    (handempty)

    ;; Ready to start with step 1
    (ready1)
  )
  (:goal (and (done)))
)