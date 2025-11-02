(define (problem bw-multiagent-problem)
  (:domain blocksworld-multiagent)
  (:objects
    ;; named stack places and the single table place
    stack1 stack2 table - place

    ;; consonant blocks (per public specification)
    M G J D C H K B L F - consonant

    ;; vowel blocks (per public specification)
    A I E - vowel
  )

  (:init
    ;; stack1 initial configuration (bottom-to-top): M G A D I B
    (on M stack1)
    (on G M)
    (on A G)
    (on D A)
    (on I D)
    (on B I)

    ;; stack2 initial configuration (bottom-to-top): J C H K E L F
    (on J stack2)
    (on C J)
    (on H C)
    (on K H)
    (on E K)
    (on L E)
    (on F L)

    ;; initial top-of-stack facts (only the top blocks are clear)
    (clear B)
    (clear F)

    ;; table is initially available as a top destination (treated as clear)
    (clear table)
  )

  ;; Target: a single-stack configuration with all 13 blocks stacked on stack1
  ;; bottom-to-top: M G J C H K E L F A I D B
  (:goal (and
    (on M stack1)
    (on G M)
    (on J G)
    (on C J)
    (on H C)
    (on K H)
    (on E K)
    (on L E)
    (on F L)
    (on A F)
    (on I A)
    (on D I)
    (on B D)
    ;; top block should be clear in the goal
    (clear B)
  ))
)