(define (problem stack-blue-yellow)
  (:domain block-stacking)

  (:objects
    blue orange yellow table - object
  )

  (:init
    ;; physical initial state (assumed as provided by the stacker agent)
    (on blue orange)
    (on orange table)
    (on yellow table)

    (clear blue)
    ;; orange is not clear (blue is on orange) -- we simply omit (clear orange) from init
    (clear yellow)

    (handempty)
    (sensors_ok)

    ;; Goal specification facts (explicit): required by validate_and_plan to compute plan
    (goal_on blue orange)
    (goal_on yellow blue)
  )

  ;; Goal: enforce final terminal conditions exactly as mandated.
  (:goal (and
           (on blue orange)
           (on yellow blue)
         ))