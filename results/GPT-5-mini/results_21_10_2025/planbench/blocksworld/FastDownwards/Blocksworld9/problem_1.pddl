(define (problem bw-prob-A)
  (:domain blocksworld)
  (:objects orange yellow red blue - block)
  (:init
    ;; stacking and table facts
    (on orange blue)
    (on yellow red)
    (ontable red)
    (ontable blue)
    ;; clear blocks
    (clear orange)
    (clear yellow)
    ;; hand
    (handempty)
  )
  (:goal (and
    (on red yellow)
    (on blue orange)
  ))
)