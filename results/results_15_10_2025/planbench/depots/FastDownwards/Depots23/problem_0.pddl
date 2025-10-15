(define (problem multi_agent_problem)
  (:domain multi_agent)

  ; Objects: union of objects appearing in both planners' inputs
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  ; INITIAL STATE: combined initial facts from planner_a and planner_b (treated as hard constraints).
  ; If a fact appears in both inputs it is included once. No additional facts are invented.
  (:init
    ; planner_a initial facts
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (hand object_11)
    (hand object_12)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ; planner_b initial facts (added, duplicates are ok but included only if missing)
    (cats object_1)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (hand object_13)
    ; hand object_12 already present
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)
    (sneeze object_5)
    (spring object_6)
    (spring object_9)
    (stupendous object_3)
    (texture object_10) ; duplicate
    (texture object_11)
    (texture object_6) ; duplicate
    (texture object_7) ; duplicate
    (texture object_8) ; duplicate
    (texture object_9) ; duplicate
  )

  ; GOALS: both scenario goals are modelled as hard conjunctive goals.
  ; NOTE: There is a strong potential conflict on next of object_12:
  ;  - planner_a goal requires (next object_12 object_8)
  ;  - planner_b goal requires (next object_12 object_10)
  ; Both are included below as hard conjunctive goals. The planner may report unsolvable
  ; if domain constraints or intended semantics make these mutually exclusive.
  (:goal (and
    ; first scenario goals (planner_a)
    (next object_11 object_7)
    (next object_12 object_8)

    ; second scenario goals (planner_b)
    (next object_12 object_10)
    (next object_13 object_9)
  ))

  ; WARNINGS / NOTES (informational; comments ignored by planners):
  ; - The goals include two different target values for "next object_12": object_8 and object_10.
  ;   If "next" is intended to be functional (only one successor per object), this is a contradiction.
  ; - The action precondition parameter mappings were underspecified in the original description;
  ;   a consistent mapping was chosen for all actions. If a different parameter-to-predicate mapping
  ;   is required, the domain must be revised.
  ; - Planner-specific action instances are provided (planner_a_* and planner_b_*). Both sets expose
  ;   the same capability signatures so either agent may perform similar transformations under its prefix.
)