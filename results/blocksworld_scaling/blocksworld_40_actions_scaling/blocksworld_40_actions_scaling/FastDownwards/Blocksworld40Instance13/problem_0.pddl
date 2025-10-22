(define (problem bw-multiagent-final)
  (:domain blocks-world-multiagent)

  ;-----------------------------------------------------------------------
  ; Comment: Integration and conflict resolution notes
  ; - Both robot reports are identical: initial state has four stacks:
  ;     Stack1: A (table) -> I -> D -> E (top)
  ;     Stack2: G (table) -> H -> J -> B (top)
  ;     Stack3: C (table)
  ;     Stack4: F (table)
  ; - Both agents report "No actions executed yet."
  ; - A 40-step action sequence was referenced but not provided. Per the
  ;   orchestration instruction to be conservative and not invent actions,
  ;   we treat the final configuration as the current observed configuration.
  ; - No conflicts between agent reports were found; therefore the initial
  ;   observed configuration is used as the required final configuration.
  ;-----------------------------------------------------------------------

  (:objects
    A B C D E F G H I J - block
    robot1 robot2 - agent
  )

  (:init
    ;; Stack 1
    (ontable A)
    (on I A)
    (on D I)
    (on E D)
    (clear E)

    ;; Stack 2
    (ontable G)
    (on H G)
    (on J H)
    (on B J)
    (clear B)

    ;; Stacks 3 and 4 (singletons)
    (ontable C)
    (clear C)
    (ontable F)
    (clear F)

    ;; Agents start with empty hands
    (handempty robot1)
    (handempty robot2)
  )

  (:goal
    (and
      ;; Every block's final placement (conservative: same as initial)
      (ontable A)
      (on I A)
      (on D I)
      (on E D)

      (ontable G)
      (on H G)
      (on J H)
      (on B J)

      (ontable C)
      (ontable F)
    )
  )
)