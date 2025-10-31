(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  ;; objects: object_0 through object_13
  (:objects
    object_0 object_1 object_2 object_3 object_4
    object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; From agent_one and agent_two (union of provided initial facts)

    ;; cats
    (cats object_0)

    ;; hands
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; sneezes
    (sneeze object_3)
    (sneeze object_4)

    ;; springs
    (spring object_5)
    (spring object_8)

    ;; stupendous
    (stupendous object_1)
    (stupendous object_2)

    ;; textures
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_10)

    ;; collect relations (union)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; next relations (union of both agents' provided next facts)
    (next object_0 object_8)
    (next object_11 object_10)

    ;; object_12 had different next targets in the two agent reports
    (next object_12 object_6)
    (next object_12 object_7)

    ;; object_13 had different next targets in the two agent reports
    (next object_13 object_9)
    (next object_13 object_7)

    ;; sneeze-related nexts (both reported)
    (next object_3 object_7)
    (next object_3 object_6)

    ;; object_4 had different next targets in the two agent reports
    (next object_4 object_10)
    (next object_4 object_9)
  )

  ;; Goals: union of goals reported by agent_one and agent_two.
  ;; Note: Several goals require facts and transitions that analysis indicates are not reachable from the given initial facts
  ;; (missing vase facts or missing collect/spring alignments). The planner will attempt to achieve these goals given the
  ;; actions and initial state; some goals may remain unreachable.
  (:goal
    (and
      ;; agent_one goals
      (next object_11 object_8)
      (next object_12 object_8)
      (next object_13 object_10)
      ;; agent_two goals
      (next object_11 object_5)
      (next object_12 object_9)
      ;; next object_13 object_10 already included above
    )
  )

  ;;; Assumptions & notes (human-readable comments to explain known gaps):
  ;;; - The initial state is the union of facts provided by the two agents. This intentionally includes multiple
  ;;;   'next' facts for the same subject when the agents reported different targets.
  ;;; - Agent analyses indicate that some required vase facts (e.g., vase object_11 object_0) or specific collect/spring
  ;;;   alignments are missing and cannot be generated with the available actions from this initial state.
  ;;;   As a consequence, certain goal atoms are unlikely to be reachable:
  ;;;     * next object_11 object_5: requires creating a vase for object_11 with cats object_0 (or other vase routes).
  ;;;       There is no sneeze predicate for object_0, and no available action sequence produces the needed vase
  ;;;       or a next alignment allowing sip/clip to create it, given the current next/spring/collect facts.
  ;;;     * next object_12 object_9 and next object_13 object_10: analyses show missing collect pairs or next alignments
  ;;;       that block moving sneeze objects to the needed targets (e.g., creating next object_3 object_9).
  ;;; - The planner will still be given the full goal set above; the comments are provided to explain known obstacles
  ;;;   in the initial data (no extra facts have been assumed or injected).
)