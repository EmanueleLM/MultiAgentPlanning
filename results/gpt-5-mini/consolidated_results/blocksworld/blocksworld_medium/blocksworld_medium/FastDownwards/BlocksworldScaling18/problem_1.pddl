(define (problem blocksworld-phased-problem)
  (:domain blocksworld-phased)
  (:objects
    worker - agent

    blue orange red yellow - block

    p1 p2 p3 p4 pend - phase
  )

  (:init
    ;; agent state
    (handempty worker)

    ;; initial block configuration (from the specification)
    (on blue yellow)
    (on orange red)
    (on-table red)
    (on-table yellow)

    ;; clearness: top blocks are clear
    (clear blue)
    (clear orange)

    ;; phases and sequencing
    (phase-active p1)
    (next-phase p1 p2)
    (next-phase p2 p3)
    (next-phase p3 p4)
    (next-phase p4 pend)

    ;; mapping which stack requires which phase (enforces ordered stacks)
    ;; final desired stacks: blue on red (phase p2), yellow on blue (phase p3), orange on yellow (phase p4)
    (requires-phase blue red p2)
    (requires-phase yellow blue p3)
    (requires-phase orange yellow p4)

    ;; a small structural trigger: advancing from p1 to p2 is only allowed after 'orange' is on the table
    (phase-trigger p1 orange)
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