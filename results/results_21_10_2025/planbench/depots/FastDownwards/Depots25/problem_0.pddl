(define (problem scenarioA)
  (:domain artifact-manipulation)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; hands
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; cats
    (cats object_0)

    ;; sneeze sources
    (sneeze object_3)
    (sneeze object_4)

    ;; springs
    (spring object_5)
    (spring object_8)

    ;; stupendous markers
    (stupendous object_1)
    (stupendous object_2)

    ;; textures (objects that are textures)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)

    ;; collect groups: textures associated with stupendous objects
    ;; group {5,6,7} -> stupendous object_1
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    ;; group {8,9,10} -> stupendous object_2
    (collect object_8 object_2)
    (collect object_9 object_2)
    (collect object_10 object_2)

    ;; initial next relations
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_7)
    (next object_13 object_7)
    (next object_3 object_6)
    (next object_4 object_9)

    ;; no initial vase facts specified (none)
  )

  ;; Scenario A goal: the reachable target set demonstrated by the provided valid plan
  (:goal (and
    (next object_11 object_8)
    (next object_12 object_8)
    (next object_13 object_10)
  ))
)