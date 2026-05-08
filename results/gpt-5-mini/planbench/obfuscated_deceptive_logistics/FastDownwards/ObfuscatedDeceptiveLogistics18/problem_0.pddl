(define (problem arrange-problem)
  (:domain arrange-sequence)
  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    slot_1 slot_2 slot_3 slot_4 slot_5 slot_6 slot_7 slot_8 slot_9 slot_10 slot_11 - slot
  )

  (:init
    ;; All slots are initially empty
    (empty slot_1)
    (empty slot_2)
    (empty slot_3)
    (empty slot_4)
    (empty slot_5)
    (empty slot_6)
    (empty slot_7)
    (empty slot_8)
    (empty slot_9)
    (empty slot_10)
    (empty slot_11)

    ;; Explicit linear successor (contiguity) chain between slots enforces ordering
    (successor slot_1 slot_2)
    (successor slot_2 slot_3)
    (successor slot_3 slot_4)
    (successor slot_4 slot_5)
    (successor slot_5 slot_6)
    (successor slot_6 slot_7)
    (successor slot_7 slot_8)
    (successor slot_8 slot_9)
    (successor slot_9 slot_10)
    (successor slot_10 slot_11)

    ;; No object is placed initially (closed-world: placed/at/next are absent)
    ;; (All negative facts are implicitly true by absence; actions use negative preconditions)
  )

  ;; The terminal condition explicitly requires object_11 to be immediately followed by object_10.
  ;; This is enforced by the next predicate; no plan can satisfy the goal unless an explicit
  ;; placement sequence creates the adjacency.
  (:goal (and
    (next object_11 object_10)
  ))
)