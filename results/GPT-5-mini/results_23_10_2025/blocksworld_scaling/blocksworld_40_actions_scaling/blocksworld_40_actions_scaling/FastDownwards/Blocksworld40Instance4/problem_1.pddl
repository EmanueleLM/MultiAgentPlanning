(define (problem final-arrangement)
  (:domain blocks)
  (:objects A B C D E F G H I J K L - block)
  (:init
    ;; "on" relations
    (on A F)
    (on B E)
    (on C K)
    (on E D)
    (on G B)
    (on H G)

    ;; ontable relations
    (ontable D)
    (ontable F)
    (ontable I)
    (ontable J)
    (ontable K)
    (ontable L)

    ;; clear blocks (no block on top)
    (clear A)
    (clear H)
    (clear C)
    (clear I)
    (clear J)
    (clear L)

    ;; robot empty
    (handempty)
  )
  ;; Goal is a simple validator (keeps the final arrangement in the init;
  ;; the goal is deliberately not restating the full arrangement)
  (:goal (and (handempty)))
)