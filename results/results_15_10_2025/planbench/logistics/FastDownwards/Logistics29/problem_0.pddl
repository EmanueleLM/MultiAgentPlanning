(define (problem orchestrator_problem)
  (:domain orchestrator_domain)

  ;; Objects as required: object_0 through object_14
  (:objects
    object_0 object_1 object_2 object_3 object_4
    object_5 object_6 object_7 object_8 object_9
    object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; Initial facts assembled from observer reports (both variants reported)
    ;; Explicit facts reported by observers:
    (cats object_0)               ;; reported by observer_c
    (cats object_1)               ;; included to enable action uses described by observers
    (cats object_2)

    (hand object_11)              ;; observer_c: many hand facts for objects 11-14
    (hand object_12)
    (hand object_13)
    (hand object_14)

    (texture object_9)            ;; target textures mentioned for goals
    (texture object_10)
    (texture object_2)

    ;; Vase and next relations set so both goal variants reported by observers
    ;; can be produced by paltry/tightfisted-like actions without inventing extra predicates.
    ;; These initial facts reflect the two distinct initial/goal variants provided in the use-case.
    (vase object_11 object_1)
    (vase object_11 object_2)

    (next object_1 object_9)
    (next object_2 object_10)

    ;; Additional facts referenced by other action schemas (reported by observers)
    (sneeze object_1)
    (sneeze object_2)
    (stupendous object_7)
    (collect object_1 object_7)
    (collect object_2 object_7)
    (spring object_3)
    (spring object_4)

    ;; Note: observers reported two distinct initial-condition variants and two goal sets.
    ;; We include facts that represent both variants in the init so both reported variants are represented.
    ;; (Observers also provided grounded plan fragments; those are documented below as comments
    ;;  and are NOT converted into PDDL actions here.)
  )

  ;; Goals: observers reported two separate goal variants.
  ;; Both goal sets are reported here explicitly. To remain fully explicit and strict
  ;; (as the observers requested), the problem goal requires both reported relations to hold.
  ;; (Variant A goal: next object_11 object_9)
  ;; (Variant B goal: next object_11 object_10)
  (:goal
    (and
      (next object_11 object_9)
      (next object_11 object_10)
    )
  )

  ;; Observers' grounded plan fragments (reported, not converted to PDDL):
  ;; - Example plan fragment A (grounded, from use-case): paltry object_11 object_1 object_9  ; would add (next object_11 object_9) and remove (vase object_11 object_1)
  ;; - Example plan fragment B (grounded, from use-case): paltry object_11 object_2 object_10 ; would add (next object_11 object_10) and remove (vase object_11 object_2)
  ;; These plan fragments are included as comments only (observers required plan fragments to be reported but not converted).
)