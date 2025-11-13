(define (problem scenario-a)
  (:domain mystery-blocks-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - block
  )
  (:init
    (on object_5 object_2)
    (ontable object_2)
    (clear object_5)

    (on object_7 object_6)
    (on object_6 object_1)
    (ontable object_1)
    (clear object_7)

    (ontable object_10)
    (clear object_10)

    (on object_12 object_11)
    (ontable object_11)
    (clear object_12)

    (on object_8 object_9)
    (ontable object_9)
    (clear object_8)

    (ontable object_0)
    (clear object_0)

    (ontable object_3)
    (clear object_3)

    (ontable object_4)
    (clear object_4)

    (ontable object_13)
    (clear object_13)

    (handempty)
  )
  (:goal
    (and
      ; Tower A
      (on object_0 object_1)
      (on object_1 object_2)
      (on object_2 object_3)
      (ontable object_3)
      (clear object_0)

      ; Tower B
      (on object_5 object_6)
      (on object_6 object_7)
      (on object_7 object_8)
      (on object_8 object_9)
      (ontable object_9)
      (clear object_5)

      ; Remaining singles
      (ontable object_4)
      (clear object_4)

      (ontable object_10)
      (clear object_10)

      (ontable object_11)
      (clear object_11)

      (ontable object_12)
      (clear object_12)

      (ontable object_13)
      (clear object_13)
    )
  )
)