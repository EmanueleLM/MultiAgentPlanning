(define (problem multi-agent-stacking-problem)
  (:domain multi-agent-stacking)

  (:objects
    ;; agents
    stacker unstacker - agent

    ;; items to be stacked/unstacked
    box1 box2 box3 - item

    ;; locations: source (initial), stack-area (where stack is built), dest (final destination)
    loc1 loc2 loc3 - location
  )

  (:init
    ;; typing convenience facts (optional but explicit)
    (agent stacker)
    (agent unstacker)
    (item box1)
    (item box2)
    (item box3)
    (location loc1)
    (location loc2)
    (location loc3)

    ;; initial positions: all boxes start at the source location (loc1), clear and not stacked
    (at box1 loc1)
    (at box2 loc1)
    (at box3 loc1)
    (clear box1)
    (clear box2)
    (clear box3)

    ;; both agents start with empty hands
    (emptyhand stacker)
    (emptyhand unstacker)

    ;; start in stacking phase
    (phase-stacking)

    ;; stacking targets (constraints): build a single stack at loc2 with box3 as base:
    ;;   box3 on table at loc2, box2 on box3, box1 on box2
    (target_at box3 loc2)
    (target_on box2 box3)
    (target_on box1 box2)

    ;; mark destination for unstacked items (final goal location)
    (destination loc3)
  )

  ;; The goal enforces all mandated terminal conditions:
  ;; - every box must be at the destination location loc3
  ;; - both agents must end with empty hands
  ;; - no box-on-box relations should remain
  (:goal
    (and
      (at box1 loc3)
      (at box2 loc3)
      (at box3 loc3)
      (emptyhand stacker)
      (emptyhand unstacker)
      (phase-unstacking)
      (not (on box1 box2))
      (not (on box2 box3))
      (not (on box1 box3))
    )
  )
)