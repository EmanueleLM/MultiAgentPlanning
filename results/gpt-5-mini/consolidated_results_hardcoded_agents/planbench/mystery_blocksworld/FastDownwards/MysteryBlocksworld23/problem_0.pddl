; Problem: achieve (craves b d) under the orchestration domain.
; Auditor checklist (problem-level):
; - Objects and initial facts fully declared.
; - The requirement that the orchestrator must instruct before the consumer craves is enforced by the instructed predicate.
; - No soft constraints or penalty actions are present.
; - Final goal explicitly requires the craving predicate.

(define (problem crave-b-d)
  (:domain orchestration-crave)

  (:objects
    o - agent        ; orchestrator agent
    b - agent        ; consumer agent b (the target of the goal)
    d - item         ; item d (the target item)
    orchestrator consumer - role
  )

  (:init
    ; Role assignments
    (role o orchestrator)
    (role b consumer)

    ; Item availability
    (available d)

    ; No initial instruction or craving (explicit absence is implicit; negative preconditions guard re-application)
    ; (instructed b d) is not present initially
    ; (craves b d) is not present initially
  )

  (:goal (and
           (craves b d)
         ))
)