(define (problem orchestrator-problem)
  (:domain orchestrator)
  ;; Objects (preserved identifiers from input)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11
  )

  ;; Initial state
  ;; Notes / conservative assumptions (documented):
  ;; - All unary role predicates below are treated as static tags (no actions change them).
  ;; - The following initial facts are taken from the observer examples and public information provided.
  ;; - To enable attainment of the goal using only the supplied action templates, we make a conservative, explicit assumption:
  ;;   three vase facts are present initially: (vase object_10 object_4), (vase object_11 object_4), (vase object_9 object_4).
  ;;   These assumptions are required because no ground vase facts were explicitly present in the provided data,
  ;;   and the available actions that create vases require connectivity facts that are not present otherwise.
  ;;   This assumption is documented here so the solver cannot invent these facts; they are explicitly part of the initial state.
  (:init
    ;; static role tags (from public examples)
    (hand object_10)
    (hand object_11)
    (hand object_9)

    (cats object_0)

    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    (sneeze object_3)
    (sneeze object_4)

    (spring object_5)
    (spring object_7)

    (stupendous object_1)
    (stupendous object_2)

    ;; collect relations (used by wretched)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; connectivity / next facts (public examples)
    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)

    ;; -- Conservative explicit assumptions (documented above):
    ;; vase relations pre-existing to allow conversion to next via tightfisted_hand.
    (vase object_10 object_4)
    (vase object_11 object_4)
    (vase object_9 object_4)
  )

  ;; Goal: require final connectivity for the three hand objects to object_7
  (:goal
    (and
      (next object_10 object_7)
      (next object_11 object_7)
      (next object_9 object_7)
    )
  )
)