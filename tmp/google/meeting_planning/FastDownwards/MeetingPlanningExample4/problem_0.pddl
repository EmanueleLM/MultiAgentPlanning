(define (problem integrated-visit-problem)
  (:domain integrated-visit)
  (:objects
    visitor jessica - person
    Presidio MarinaDistrict - location
  )

  (:init
    ;; Both present in Presidio at 09:00 (540). Time itself is implicit via durative actions and TILs.
    (at visitor Presidio)
    (at jessica Presidio)
  )

  ;; Jessica moves to MarinaDistrict at 09:15 (555) and leaves MarinaDistrict at 17:45 (1065).
  ;; We use timed-initial-literals to represent Jessica's availability window at MarinaDistrict.
  (:timed-initial-literals
    ;; At 09:15 Jessica becomes at MarinaDistrict and is no longer at Presidio.
    (at 555 (at jessica MarinaDistrict))
    (at 555 (not (at jessica Presidio)))

    ;; At 17:45 Jessica is no longer at MarinaDistrict.
    (at 1065 (not (at jessica MarinaDistrict)))
  )

  (:goal (met visitor jessica))
)