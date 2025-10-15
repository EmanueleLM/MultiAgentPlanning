(define (problem scenario-1)
  (:domain multiagent-tasks)
  (:objects
    planner_a planner_b - agent
    s1 s2 s3 s4 s5 s6 - slot
  )
  (:init
    ;; agents present
    (agent planner_a)
    (agent planner_b)

    ;; slots exist and availability (only slots explicitly free are marked)
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6)
    (slot-free s1) (slot-free s2) (slot-free s3) (slot-free s4) (slot-free s5) (slot-free s6)

    ;; earliest ordering: enforce that actions must use the earliest available slot
    (earliest s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    ;; s6 has no next (final)

    ;; Initially none of the task completion predicates are true
  )
  (:goal
    (and
      ;; In scenario 1 require all actions (both agents) to be completed
      (paltry-done planner_a)
      (sip-done planner_a)
      (clip-done planner_a)
      (wretched-done planner_b)
      (memory-done planner_b)
      (tightfisted-done planner_b)
    )
  )
)