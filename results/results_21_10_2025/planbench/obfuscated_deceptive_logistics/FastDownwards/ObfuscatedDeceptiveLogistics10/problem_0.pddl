(define (problem duo-collect-problem)
  (:domain duo-collect)
  (:objects
    p1 p2 - agent
    vase1 cat1 - object
    rough - texturetype
  )
  (:init
    ;; world facts: vase1 is a vase; cat1 is a cat and has rough texture
    (vase vase1)
    (cats cat1)
    (texture cat1 rough)

    ;; No agent starts holding any object: (hand ...) facts are absent intentionally.
    ;; No object is initially spring-active or stupendous; sneeze and collect are initially false.
  )
  (:goal (and
    ;; player1 must collect the vase; player2 must collect the cat
    (collect p1 vase1)
    (collect p2 cat1)
  ))
)