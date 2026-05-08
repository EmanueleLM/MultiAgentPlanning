(define (problem bw-problem-orange-on-blue)
  (:domain blocksworld)
  (:objects
    blue orange red yellow - block
  )
  (:init
    ;; initial stack (top to bottom): blue on orange on red on yellow on table
    (on blue orange)
    (on orange red)
    (on red yellow)
    (ontable yellow)

    ;; clear and hand state as specified
    (clear blue)
    (handempty)
  )
  (:goal (and
    (on orange blue)
  ))
)