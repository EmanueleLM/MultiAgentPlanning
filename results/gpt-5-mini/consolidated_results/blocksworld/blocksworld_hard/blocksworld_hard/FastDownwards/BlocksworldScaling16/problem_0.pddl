(define (problem blocks-problem-actor-plan)
  (:domain blocks-order-enforced)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Comments / minimal assumptions:
  ; - Types: blocks and explicit step objects are used to enforce the exact
  ;   actor plan ordering. The planner cannot reorder actions because each
  ;   action requires the current at-step and advances to the next step via
  ;   the next relation.
  ; - Single-hand invariant: actions that pick/unstack require handempty;
  ;   actions that produce holding remove handempty. There is no token/counter
  ;   bookkeeping — all constraints are modeled as world predicates.
  ; - Action models follow standard instantaneous, single-block blocks-world
  ;   semantics (unstack, putdown, pickup, stack).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    blue red orange yellow - block
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 - step
  )

  (:init
    ;; Observer-supplied initial state (positive ground predicates)
    (ontable orange)
    (on red orange)
    (on yellow red)
    (on blue yellow)
    (clear blue)
    (handempty)

    ;; Plan-order enforcement: start at step1 and define the chain step1->step2->...->step11
    (at-step step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
    (next step6 step7)
    (next step7 step8)
    (next step8 step9)
    (next step9 step10)
    (next step10 step11)
  )

  ;; The goal fixes the mandated terminal conditions and requires that the plan
  ;; progressed through all steps by asserting at-step step11. All preferences
  ;; are encoded as hard constraints in the goal.
  (:goal (and
    (on orange red)
    (on blue yellow)
    (ontable red)
    (ontable yellow)
    (clear orange)
    (clear blue)
    (handempty)
    (at-step step11)
  ))
)