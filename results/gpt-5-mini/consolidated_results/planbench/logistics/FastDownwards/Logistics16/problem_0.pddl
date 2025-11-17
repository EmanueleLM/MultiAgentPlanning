(define (problem example_A)
  (:domain corrected_neutral_model)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - object
  )

  (:init
    ;; Type facts
    (Cat object_0)
    (Hand object_9)
    (Hand object_10)
    (Hand object_11)
    (Hand object_12)
    (Sneezer object_3)
    (Sneezer object_4)
    (SpringNode object_5)
    (SpringNode object_7)
    (Collector object_1)
    (Collector object_2)
    (Texture object_5)
    (Texture object_6)
    (Texture object_7)
    (Texture object_8)

    ;; Collected relations (texture -> collector)
    (Collected object_5 object_1)
    (Collected object_6 object_1)
    (Collected object_7 object_2)
    (Collected object_8 object_2)

    ;; Initial attachments (mapped from initial next(...) facts)
    (Attached object_0 object_5)
    (Attached object_10 object_7)
    (Attached object_11 object_8)
    (Attached object_12 object_5)
    (Attached object_3 object_6)
    (Attached object_4 object_8)
    (Attached object_9 object_8)

    ;; Free-attached facts for entities that are not attached initially
    (free-attached object_1)
    (free-attached object_2)
    (free-attached object_5)
    (free-attached object_6)
    (free-attached object_7)
    (free-attached object_8)
    (free-attached object_13)

    ;; Free-held: no entity is held at the start (conservative)
    (free-held object_0)
    (free-held object_1)
    (free-held object_2)
    (free-held object_3)
    (free-held object_4)
    (free-held object_5)
    (free-held object_6)
    (free-held object_7)
    (free-held object_8)
    (free-held object_9)
    (free-held object_10)
    (free-held object_11)
    (free-held object_12)
    (free-held object_13)
  )

  (:goal (and
    (Attached object_10 object_8)
    (Attached object_11 object_6)
    (Attached object_12 object_8)
    (Attached object_9 object_5)
  ))
)