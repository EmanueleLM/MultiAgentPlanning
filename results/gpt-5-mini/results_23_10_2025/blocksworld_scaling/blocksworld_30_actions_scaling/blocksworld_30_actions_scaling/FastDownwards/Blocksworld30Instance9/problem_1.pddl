(define (problem Blocksworld30Instance9-problem)
  (:domain blocksworld_observed)
  (:objects
    A B C D E F G H I J K - block
  )
  (:init
    ;; table bottoms
    (ontable D)
    (ontable E)
    (ontable H)

    ;; stack1: D - A - G - B - K - F  (bottom -> top)
    (on A D)
    (on G A)
    (on B G)
    (on K B)
    (on F K)

    ;; stack2: E - J - C - I
    (on J E)
    (on C J)
    (on I C)

    ;; clear tops initially: F, I, H
    (clear F)
    (clear I)
    (clear H)

    ;; single hand available
    (handempty)
  )
  ;; Goal: reach completion of the recorded sequence (done30)
  (:goal (and (done30)))
)