(define (problem build-tower-phased)
  (:domain stacked-blocks-phased)
  (:objects
    worker - agent

    a b c - block
    table - table

    p1 p2 pend - phase
  )

  (:init
    ;; agent and hand
    (agent worker)
    (handempty worker)

    ;; initial spatial configuration: all blocks on the table and clear
    (block a) (block b) (block c)
    (table table)
    (on a table) (on-table a)
    (on b table) (on-table b)
    (on c table) (on-table c)
    (clear a) (clear b) (clear c)

    ;; phases: p1 then p2 then pend (end)
    (phase p1) (phase p2) (phase pend)
    (phase-active p1)
    ;; mapping required stacks to phases:
    ;; First: stack b onto c in phase p1
    (requires-phase b c p1)
    ;; Second: stack a onto b in phase p2
    (requires-phase a b p2)

    ;; sequencing of phases
    (next-phase p1 p2)
    (next-phase p2 pend)
  )

  (:goal
    (and
      ;; final tower: a on b, b on c, c on table
      (on a b)
      (on b c)
      (on c table)

      ;; top-of-tower is clear
      (clear a)

      ;; phase completion markers: both required phases completed
      (phase-completed p1)
      (phase-completed p2)

      ;; final hand state (agent free)
      (handempty worker)
    )
  )
)