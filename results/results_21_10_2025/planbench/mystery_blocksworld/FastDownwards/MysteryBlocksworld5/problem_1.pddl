(define (problem stmt1-next-9-8)
  (:domain MysteryBlocksworld5)
  ; Assumptions / notes:
  ; - Objects are object_0 .. object_9.
  ; - This problem encodes the first STATEMENT initial facts and goal.
  ; - The provided plan (clip object_9 object_4 object_7; wretched object_4 object_7 object_8 object_2; tightfisted object_9 object_4 object_8)
  ;   is applicable under these initial facts and achieves the goal next object_9 object_8.
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object
  )
  (:init
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_9)
    (next object_0 object_7)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_7)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
  )
  (:goal (and
    (next object_9 object_8)
  ))
)