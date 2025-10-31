(define (problem hanoi_multiagent_problem)
  (:domain hanoi_multiagent)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; initial stack: all disks on left peg (E bottom, D, C, B, A top)
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)

    ;; size ordering (smaller X Y means X is smaller than Y)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller A E)

    (smaller B C)
    (smaller B D)
    (smaller B E)

    (smaller C D)
    (smaller C E)

    (smaller D E)

    ;; agent availability according to provided data:
    (agent1-enabled)
    ;; Note: agent2-enabled is intentionally not set, so agent_2_move_* actions are unavailable.
  )

  (:goal (and
    (on A right)
    (on B right)
    (on C right)
    (on D right)
    (on E right)
  ))
)