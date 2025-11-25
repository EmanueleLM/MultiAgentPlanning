(define (problem blocksworld-phased-problem)
  (:domain blocksworld-phased)
  (:objects
    worker - agent

    blue orange red yellow - block

    p1 p2 p3 p4 - phase
  )

  (:init
    ;; agent state
    (handempty worker)

    ;; initial block configuration (from the specification)
    (on blue yellow)
    (on orange red)
    (on-table red)
    (on-table yellow)

    ;; clearness: top blocks are clear per specification
    (clear blue)
    (clear orange)

    ;; explicit phase sequencing: only p1 active initially
    (phase-active p1)
    (next-phase p1 p2)
    (next-phase p2 p3)
    (next-phase p3 p4)

    ;; map each required final stack to a phase (enforces ordered stacks)
    ;; desired final stacks: blue on red, yellow on blue, orange on yellow
    (requires-phase blue red p1)
    (requires-phase yellow blue p2)
    (requires-phase orange yellow p3)
  )

  (:goal
    (and
      ;; final spatial goal: orange on yellow, yellow on blue, blue on red
      (on orange yellow)
      (on yellow blue)
      (on blue red)

      ;; final hand state (agent free)
      (handempty worker)
    )
  )
)