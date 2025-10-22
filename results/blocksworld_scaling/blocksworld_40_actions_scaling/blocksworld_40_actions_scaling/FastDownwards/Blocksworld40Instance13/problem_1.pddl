(define (problem bw-multiagent-final)
  (:domain blocks-world-multiagent)

  ;-----------------------------------------------------------------------
  ; Integration notes:
  ; - No conflicts were found between the agents' reports.
  ; - The initial configuration below encodes the exact stacks given.
  ; - The goal encodes the final arrangement derived by applying the 40-step
  ;   action sequence in the provided order. This PDDL is intended for a
  ;   classical planner (Fast Downward).
  ;-----------------------------------------------------------------------

  (:objects
    A B C D E F G H I J - block
    robot1 robot2 orchestrator - agent
  )

  (:init
    ;; Stack 1: A (table) -> I -> D -> E (top)
    (ontable A)
    (on I A)
    (on D I)
    (on E D)
    (clear E)

    ;; Stack 2: G (table) -> H -> J -> B (top)
    (ontable G)
    (on H G)
    (on J H)
    (on B J)
    (clear B)

    ;; Singletons on table
    (ontable C)
    (clear C)
    (ontable F)
    (clear F)

    ;; Agents start with empty hands
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)
  )

  (:goal
    (and
      ;; Final Stack 1: A (table) -> I -> E -> D (top)
      (ontable A)
      (on I A)
      (on E I)
      (on D E)

      ;; Final Stack 2: G (table) -> H -> J -> B (top)
      (ontable G)
      (on H G)
      (on J H)
      (on B J)

      ;; Final Stack 3: F (table) -> C (top)
      (ontable F)
      (on C F)
    )
  )
)