(define (problem multi_observers_problem)
  (:domain multi_observers)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions and notes:
  ; - Observations from observer_A and observer_B have been merged by union.
  ;   Where observers disagreed about which ground facts hold, both facts are
  ;   included if provided by at least one observer. This is a merging choice
  ;   (union) because no explicit conflict resolution rule was provided.
  ; - Action schemas have been kept distinct per observer by prefixing with
  ;   observer_A_ or observer_B_. The schemas are otherwise replicated as
  ;   reported by each observer to preserve provenance of capabilities.
  ; - No additional predicates, objects, or actions were invented beyond the
  ;   two observer reports. Preferences were treated as hard constraints and
  ;   encoded as normal preconditions/effects where present in observers'
  ;   descriptions.
  ; - If the merged initial state still leaves the listed goals unreachable by
  ;   the provided actions, that is a property of the original reports; the
  ;   domain/problem below is faithful to the inputs.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect facts (union of observer_A and observer_B reports)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    ;; (collect object_8 object_2) duplicated in inputs - kept once
    (collect object_9 object_3)

    ;; hands
    (hand object_11)
    (hand object_12)
    (hand object_13)

    ;; next relations (union of both observers' reported trues)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_12 object_10)
    (next object_3 object_7)
    (next object_4 object_10)
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)

    ;; sneeze predicates
    (sneeze object_3)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring predicates (union)
    (spring object_5)
    (spring object_8)
    (spring object_6)
    (spring object_9)

    ;; stupendous predicates (union)
    (stupendous object_1)
    (stupendous object_2)
    (stupendous object_3)

    ;; texture predicates (union)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
    (texture object_11)

    ;; Note: No initial (vase ...) facts were reported by either observer; none
    ;; are included here.
  )

  (:goal (and
    (next object_11 object_7)
    (next object_12 object_8)
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)