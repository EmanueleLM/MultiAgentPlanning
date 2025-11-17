(define (problem scenarioA)
  (:domain assembly)
  (:objects
    object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - object
    operator1 - operator
    assistant1 - assistant
    loc_storage loc_workbench - location
    s1 s2 s3 s4 s5 s6 s7 - step
  )

  (:init
    ;; initial object placements
    (at object_9 loc_storage)
    (at object_7 loc_storage)
    ;; other objects can be present but not needed for this scenario; they are left unspecified intentionally.

    ;; agent starting locations and availability
    (at-agent operator1 loc_storage)
    (at-agent assistant1 loc_storage)
    (free operator1)
    (free assistant1)

    ;; step sequencing (explicit ordered phases required by auditor remediation)
    (step-succ s1 s2)
    (step-succ s2 s3)
    (step-succ s3 s4)
    (step-succ s4 s5)
    (step-succ s5 s6)
    (step-succ s6 s7)

    ;; begin at the first step; all actions must follow the step-succ chain and update current-step
    (current-step s1)
  )

  (:goal
    (and
      ;; Primary scenario A target relation to be achieved
      (next object_9 object_7)
      ;; terminal conditions mandated by the auditor: objects must be at the final assembly location
      (at object_9 loc_workbench)
      (at object_7 loc_workbench)
      ;; enforce that plan reached the final required phase
      (current-step s7)
    )
  )
)