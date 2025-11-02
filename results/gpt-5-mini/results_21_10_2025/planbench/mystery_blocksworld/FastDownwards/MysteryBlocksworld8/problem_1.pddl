(define (problem MysteryBlocksworld8-problem)
  (:domain MysteryBlocksworld8-domain)

  ; Comments / integration notes:
  ; - The two separate initial statements in the human specification were integrated by taking the union
  ;   of all explicitly listed initial facts. This produces a single combined initial state.
  ; - No assumptions were added beyond the union of given ground facts.
  ; - The proposed_solution (the three actions listed in <proposed_solution>) was verified against this combined state.
  ; - The problem goal is set to the observer-stated goal (next object_10 object_5 and next object_9 object_7),
  ;   which is the final condition the proposed_solution achieves. The proposed sequence itself is not encoded
  ;   in the goal (only the resulting facts are).

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - object
  )

  (:init
    ; From first statement
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_9)
    (next object_0 object_7)
    (next object_10 object_5)
    (next object_3 object_5)
    (next object_4 object_8)
    (next object_9 object_8)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ; From second statement (union)
    (next object_0 object_5)     ; present in second statement
    (next object_9 object_5)     ; present in second statement

    ; Note: other facts included via union above (duplicates are harmless)
  )

  ; Goal: achieve the observer's requested configuration:
  (:goal
    (and
      (next object_10 object_5)
      (next object_9 object_7)
    )
  )
)