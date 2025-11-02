(define (problem bw-multi-1)
  (:domain blocks-multiagent)
  (:objects
    a b c - block
    ag1 ag2 - agent
  )
  (:init
    ;; Initial stack: a on b, b on c, c on table
    (on a b)
    (on b c)
    (ontable c)
    ;; Clear and hands
    (clear a)
    (handempty ag1)
    (handempty ag2)
  )
  ;; Goal corresponds to the final arrangement derived from the action sequence:
  ;; b on table, c on b, a on c
  (:goal (and
    (on a c)
    (on c b)
    (ontable b)
  ))
)