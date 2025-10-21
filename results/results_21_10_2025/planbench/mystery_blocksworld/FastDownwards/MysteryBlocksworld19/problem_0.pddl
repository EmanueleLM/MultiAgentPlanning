(define (problem orchestrator-problem-next-11-9)
  (:domain orchestrator)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Objects
  ; We model all referenced objects from the analyst reports.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:objects
    object_0 object_1 object_2 object_3 object_4
    object_5 object_6 object_7 object_8 object_9
    object_10 object_11 - obj
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Initial state
  ; Facts are taken directly from the analyst inputs.
  ; If any information was ambiguous in the textual reports,
  ; we preserved only the explicitly listed initial facts.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:init
    ;; unary static properties
    (cats object_0)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)
    (hand object_11)

    ;; texture facts explicitly given
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; collect relations (static)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; initial next relations N as reported
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_3 object_7)
    (next object_4 object_8)

    ;; No vase facts initially (explicit in the report)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Goal selection
  ; The analyst produced two relevant goals in different sections:
  ;  - next object_11 object_10 (achieved by 11-step plan in report part A)
  ;  - next object_11 object_9  (achieved by a concise 4-action plan in report part B)
  ;
  ; This problem instance encodes the concise goal: next object_11 object_9
  ; (the 4-action plan provided in the report is sufficient from the
  ; given initial state and the domain actions).
  ;
  ; If you prefer the alternative goal (next object_11 object_10),
  ; create a separate problem instance with that goal; both goals are
  ; expressible in this domain without adding further predicates.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:goal (and
    (next object_11 object_9)
  ))
)