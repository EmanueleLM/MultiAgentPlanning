; PROBLEM: scenario_1
; Comment: Auditor findings and fixes:
; - The original player plan used two memory actions and a sip with t=object_5,
;   which made sip require next(object_8,object_5) that never exists.
; - Auditor's preferred correction (Option 2) was to remove both memory
;   bookkeeping steps and change sip's texture parameter to object_6 so that
;   sip(object_8,object_0,object_6) is applicable in the initial state.
; - The domain is unchanged; the recommended valid minimal plan for this
;   problem (informative only) is:
;     1) sip object_8 object_0 object_6
;     2) paltry object_8 object_0 object_6
;   That plan creates vase(object_8,object_0) then consumes it to re-add
;   next(object_8,object_6). However, the stated goal for scenario_1 is
;   already satisfied in the initial state. This problem encodes the
;   validated initial facts and the goal as strict requirements.
(define (problem scenario_1)
  (:domain next-vase-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8
  )
  (:init
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_2)
    (hand object_7)
    (hand object_8)
    (next object_0 object_6)
    (next object_3 object_5)
    (next object_4 object_6)
    (next object_7 object_6)
    (next object_8 object_6)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_6)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
  )
  (:goal (and (next object_7 object_6) (next object_8 object_6)))
)