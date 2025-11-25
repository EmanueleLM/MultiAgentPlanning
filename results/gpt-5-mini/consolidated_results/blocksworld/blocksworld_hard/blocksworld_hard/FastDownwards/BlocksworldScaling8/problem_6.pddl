(define (problem BlocksworldScaling8-prob)
  (:domain BlocksworldScaling8)
  (:objects
    red yellow blue orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )
  (:init
    ; single-handedness initially
    (handempty)

    ; initial stack: red on yellow on blue on orange on table
    (on red yellow)
    (on yellow blue)
    (on blue orange)
    (ontable orange)

    ; clear means no block on top and not currently held
    (clear red)
    ; yellow, blue, orange are not clear initially (because something on top)
    ; stage/time initialization: start at s0 and provide a linear successor chain
    (at s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
  )
  (:goal (and
    (on red blue)
    (on orange red)
  ))
)