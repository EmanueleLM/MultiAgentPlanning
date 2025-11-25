(define (problem stack-problem)
  (:domain blocksworld-ordered)
  (:objects
    red yellow blue orange - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )
  (:init
    ;; Initial stack: red on yellow on blue on orange on table
    (on red yellow)
    (on yellow blue)
    (on blue orange)
    (ontable orange)

    ;; Clearness: only the top block (red) is clear
    (clear red)

    ;; Hand is empty initially
    (handempty)

    ;; Stage ordering and start stage token
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12)
    (current s0)
  )

  (:goal (and
    ;; Goal terminal conditions as specified
    (on red orange)
    (on orange blue)
    (on yellow red)
  ))
)