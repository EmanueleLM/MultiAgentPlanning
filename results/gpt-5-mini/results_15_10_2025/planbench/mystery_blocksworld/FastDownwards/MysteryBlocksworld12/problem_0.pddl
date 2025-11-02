; Problem: scenarioA
; This scenario aims to achieve paltry, sip and clip tasks.
(define (problem scenarioA)
  (:domain orchestrator)
  (:objects
    paltry sip clip wretched memory tightfisted - task
  )
  (:init
    ; no tasks are done at start
  )
  (:goal (and
    (done paltry)
    (done sip)
    (done clip)
  ))
)