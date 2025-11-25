(define (problem bw-move-red)
  (:domain blocks-singlehand)
  (:objects
    red yellow orange blue - block
  )
  (:init
    ;; Initial world facts provided
    (clear red)
    (clear orange)
    (handempty)
    (on red yellow)
    (on yellow blue)
    (ontable blue)
    (ontable orange)

    ;; Explicit distinctness facts (enforce block identity and allow action schemas
    ;; to require distinct arguments without using equality/negative preconditions)
    (distinct red yellow)
    (distinct red orange)
    (distinct red blue)
    (distinct yellow red)
    (distinct yellow orange)
    (distinct yellow blue)
    (distinct orange red)
    (distinct orange yellow)
    (distinct orange blue)
    (distinct blue red)
    (distinct blue yellow)
    (distinct blue orange)
  )

  (:goal
    (and
      (on red orange)
    )
  )
)