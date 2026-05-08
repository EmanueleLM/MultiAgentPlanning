(define (problem bw-problem-orange-on-blue)
  (:domain blocksworld)
  (:objects
    blue orange red yellow - block
    s0 s1 s2 s3 s4 - stage
  )
  (:init
    ;; Initial block configuration (single contiguous stack: yellow <- red <- orange <- blue)
    (on blue orange)
    (on orange red)
    (on red yellow)
    (ontable yellow)

    ;; Provided clear/hand state (top is blue, hand empty)
    (clear blue)
    (handempty)

    ;; Stage ordering for discrete time progression; actions must advance current -> next.
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (current s0)
  )
  (:goal (and
    (on orange blue)
  ))
)