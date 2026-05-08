(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6
    object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; type/category unary predicates (as provided)
    (cats object_0)
    (cats object_1)

    (hand object_12)
    (hand object_13)
    (hand object_14)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)
    (texture object_11)

    ;; collect relations (groupings for wretched)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_9 object_3)

    ;; initial next links (subjects that currently have a next)
    (next object_0 object_6)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_6)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    ;; cleared-next facts for objects that currently have no next:
    ;; subjects with no next initially: object_2, object_3, object_6, object_7, object_8, object_9, object_10, object_11
    ;; (these are allowed to be subjects later; they begin with no next)
    (cleared-next object_2)
    (cleared-next object_3)
    (cleared-next object_6)
    (cleared-next object_7)
    (cleared-next object_8)
    (cleared-next object_9)
    (cleared-next object_10)
    (cleared-next object_11)
  )

  (:goal (and
    (next object_12 object_10)
    (next object_13 object_10)
    (next object_14 object_9)
  ))
)