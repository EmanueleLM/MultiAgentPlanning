(define (problem assemble-sequence-object9-8)
  (:domain sequence-assembly)
  (:objects
    planner1 - agent
    sensor1 - agent
    auditor1 - agent

    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - object

    planning sensing auditing - phase
  )

  (:init
    ;; Agents ready
    (planner-ready planner1)
    (sensor-ready sensor1)
    (auditor-ready auditor1)

    ;; Start in planning phase
    (at-phase planning)

    ;; Initially every object is free to be linked
    (free-successor object_1)
    (free-successor object_2)
    (free-successor object_3)
    (free-successor object_4)
    (free-successor object_5)
    (free-successor object_6)
    (free-successor object_7)
    (free-successor object_8)
    (free-successor object_9)

    (free-predecessor object_1)
    (free-predecessor object_2)
    (free-predecessor object_3)
    (free-predecessor object_4)
    (free-predecessor object_5)
    (free-predecessor object_6)
    (free-predecessor object_7)
    (free-predecessor object_8)
    (free-predecessor object_9)

    ;; No proposed, sensed, locked, or next relations exist initially
  )

  ;; Mandated terminal conditions: the immediate-next relation must exist and be locked by the auditor.
  (:goal (and
    (next object_9 object_8)
    (locked object_9 object_8)
  ))
)