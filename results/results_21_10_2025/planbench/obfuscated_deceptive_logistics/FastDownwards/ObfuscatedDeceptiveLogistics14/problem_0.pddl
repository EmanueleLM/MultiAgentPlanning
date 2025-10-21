(define (problem scenario1)
  (:domain multi_scenario_domain)
  ;; Objects present in scenario 1
  (:objects
    object_6 object_7 object_9 object_10 object_11 object_12 - obj
  )

  ;; Initial facts for scenario 1
  ;; NOTE: these initial facts follow the minimal assumptions required by the candidate plan
  ;; described in the analysis: memory is used to remap next(...) links to object_7.
  (:init
    ;; existing next links that memory will move
    (next object_10 object_11)
    (next object_12 object_11)
    ;; existing link to the target already present so no action needed for object_11
    (next object_11 object_7)

    ;; unary facts required by memory preconditions
    (cats object_10)
    (cats object_12)
    (spring object_11)
    (spring object_7)
  )

  ;; Goals for scenario 1
  (:goal
    (and
      (next object_10 object_7)
      (next object_11 object_7)
      (next object_12 object_7)
    )
  )

  ;; Assumptions / notes (PDDL comment style)
  ;; Assumptions made because the original description omitted concrete initial atoms:
  ;;  - memory will be used to transform next(object_10,object_11) -> next(object_10,object_7)
  ;;    and next(object_12,object_11) -> next(object_12,object_7).
  ;;  - Therefore we include next(object_10,object_11), next(object_12,object_11), and next(object_11,object_7)
  ;;    in the initial state.
  ;;  - We declare cats(object_10) and cats(object_12), and spring(object_11) and spring(object_7),
  ;;    to satisfy memory's preconditions.
  ;; If you prefer an alternative plan (e.g., using paltry/tightfisted/wretched/sip/clip),
  ;; provide the exact initial vase/hand/sneeze/texture/collect/stupendous bindings and we will validate/create
  ;; a corresponding problem instance.
)