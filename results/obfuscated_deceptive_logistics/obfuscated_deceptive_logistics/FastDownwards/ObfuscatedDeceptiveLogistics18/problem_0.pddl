; Problem: orchestrator-problem
; Assumptions and notes about the provided scenario and modelling choices:
; - The user provided no concrete initial-statement blocks or explicit goal facts in the prompt.
;   The observer role in the brief referenced two separate initial blocks and goals but those
;   blocks were not included in the input to this task. To produce a runnable Fast Downward
;   problem that exercises the six actions and respects the provided signatures, the following
;   minimal conservative initial facts were added as explicit assumptions (listed below).
; - All added initial facts are conservative and minimal: they establish just enough preconditions
;   to allow a short, executable plan that demonstrates how the modeled actions can achieve goals.
; - If the real scenario contains different initial facts or goals, these assumptions must be replaced.
; - No temporal or durative modelling was added; all actions are instantaneous STRIPS operators.
(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  ; Conservative initial facts (assumed because original initial statements were not provided):
  ; - Provide exactly the minimal preconditions enabling three actions that establish the listed goals.
  ;   These are assumptions to make the planning problem concrete and solvable by Fast Downward.
  (:init
    ; For player_paltry (hand ?a ?b)
    (hand object_0 object_1)

    ; For player_sip (vase ?a ?b)
    (vase object_2 object_3)

    ; For player_memory (texture ?a ?b)
    (texture object_4 object_5)

    ; Additional conservatively included facts (do not contradict above)
    (next object_6 object_7)
    (cats object_7 object_8)
    (collect object_10 object_11)
    (spring object_12 object_13)
  )

  ; Goals: chosen to match the conservative effects of three actions so the domain is demonstrable.
  ; These goals reflect the minimal intended postconditions the user-description suggested might be relevant.
  (:goal
    (and
      ; Achievable by: player_paltry object_0 object_1 object_2  -> (collect object_1 object_2)
      (collect object_1 object_2)

      ; Achievable by: player_sip object_2 object_3 object_4 -> (sneeze object_3 object_4)
      (sneeze object_3 object_4)

      ; Achievable by: player_memory object_4 object_5 object_6 -> (stupendous object_5 object_6)
      (stupendous object_5 object_6)
    )
  )
)
; Unresolved ambiguities (must be clarified for a faithful formalization):
; - Exact intended arities and semantics of predicates like hand, cats, texture, etc. were not given.
;   We modeled all as binary for STRIPS compatibility; if some are unary/ternary, the domain must be updated.
; - The original brief referenced conditional effects for actions; this formalization omits conditional effects
;   because Fast Downward classical STRIPS was requested. If conditional behavior is required, each condition
;   must be compiled into separate deterministic operators or extra predicates encoding the context.
; - Two separate initial-statement blocks and goals were mentioned in the brief; they were not supplied.
;   The initial facts and goals included above are conservative placeholders to allow an executable example.
; - If there are constraints/preferences expressed in natural language in the original scenario (e.g., avoid,
;   earliest), these must be translated into constraints or ordering facts and added explicitly; not enough
;   information was provided to encode them here.