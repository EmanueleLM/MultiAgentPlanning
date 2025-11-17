(define (problem obfuscated-deceptive-logistics27-problem)
  (:domain obfuscated-deceptive-logistics27)

  (:objects
    ;; Objects typed to encode static membership instead of enumerating many init facts.
    object_12 object_13 object_14 - hand
    object_0 object_1             - cat
    object_4 object_5             - sneeze
    object_2 object_3             - stupendous
    object_6 object_7 object_8 object_9 object_10 object_11 - texture
  )

  (:init
    ;; Minimal static relations retained as predicates only where they are non-trivial
    ;; (i.e., relations that are not expressible as simple type-membership).
    ;; collect facts used by wretched steps:
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; small set of spring facts (overlaps with texture-type objects)
    (spring object_6)
    (spring object_9)

    ;; initial dynamic 'next' relations (only those present in the original instance).
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)
  )

  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))
  ;;; Comments / assumptions:
  ;;; - Type declarations encode membership for hand, cat, sneeze, stupendous, and texture,
  ;;;   eliminating many per-object unary facts from :init.
  ;;; - The remaining predicates in :init are only the non-unary relations needed to
  ;;;   make the goals reachable: collect, spring, and next.
  ;;; - This preserves the original action templates' semantics; actions still require
  ;;;   the same relations, but static membership is enforced by typing rather than init facts.