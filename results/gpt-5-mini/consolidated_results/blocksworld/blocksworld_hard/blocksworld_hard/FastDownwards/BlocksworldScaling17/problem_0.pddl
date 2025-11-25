(define (problem blocks-problem-1)
  (:domain blocksworld)
  (:objects A B C - block)

  (:init
    ;; Initial stack: A on B, B on C, C on table
    (on A B)
    (on B C)
    (ontable C)

    ;; Clear status: only A is clear at start
    (clear A)

    ;; Hand starts empty
    (handempty)
  )

  ;; Goal: form stack B on A on C, with C on table and hand empty
  (:goal (and
           (on B A)
           (on A C)
           (ontable C)
           (handempty)
        )
  )
)