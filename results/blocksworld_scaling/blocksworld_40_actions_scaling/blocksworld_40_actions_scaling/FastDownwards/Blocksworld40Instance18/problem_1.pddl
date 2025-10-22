(define (problem blocks-final-verified)
  (:domain blocks-world-verified)
  (:objects
    a b c d e f g h i j k l - block
  )

  ;; Initial state derived from the specification
  (:init
    ;; initial on / ontable relations (initial stacks)
    (on a l)
    (on l e)
    (on e i)
    (on i g)
    (ontable g)

    (on d f)
    (on f h)
    (on h j)
    (ontable j)

    (ontable b)
    (ontable c)
    (ontable k)

    ;; initial clear blocks (those with nothing on top)
    (clear a)
    (clear d)
    (clear b)
    (clear c)
    (clear k)

    ;; hand is empty initially
    (handempty)
  )

  ;; Goal: perform the verification action (the action's preconditions encode the final arrangement)
  (:goal (verified))
)