; Scenario 1: derived from the first agent observation.
; Minimal modeling notes:
; - The observation set did not define some intermediate predicates (paired, clipped, tight).
;   These are introduced here to implement the public actions conservatively:
;   sip creates (paired ?hand ?src); paltry consumes that pairing and adds (next ?hand ?target).
; - Actions avoid deleting existing next links. The goal only requires that certain next facts become true;
;   therefore paltry and memory only add next facts (paltry also removes the temporary pairing).
; - No quantifiers or unsupported features are used. Types are declared and all objects present are enumerated.

(define (problem scenario1)
  (:domain orchestrated)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
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
  (:goal (and
    (next object_7 object_5)
    (next object_8 object_5)
  ))
)