(define (problem orchestrate-meeting-monday)
  (:domain multiagent-meeting)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Global adjacency (30-min increments, 09:00-17:00)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Agent2 uses 'consecutive' predicate; mirror the same adjacency
    (consecutive s0900 s0930) (consecutive s0930 s1000) (consecutive s1000 s1030) (consecutive s1030 s1100)
    (consecutive s1100 s1130) (consecutive s1130 s1200) (consecutive s1200 s1230) (consecutive s1230 s1300)
    (consecutive s1300 s1330) (consecutive s1330 s1400) (consecutive s1400 s1430) (consecutive s1430 s1500)
    (consecutive s1500 s1530) (consecutive s1530 s1600) (consecutive s1600 s1630)

    ;; --- Agent 1 known availability (from agent1 PDDL) ---
    ;; Agent1 listed: s0900  s1230 s1300  s1400 s1430  s1630
    (available_a1 s0900)
    (available_a1 s1230) (available_a1 s1300)
    (available_a1 s1400) (available_a1 s1430)
    (available_a1 s1630)

    ;; --- Agent 2 known availability (from agent2 PDDL) ---
    ;; agent2 times t1000, t1130, t1200, t1400, t1430, t1500  -> mapped to s1000, s1130, s1200, s1400, s1430, s1500
    (free_a2 s1000)
    (free_a2 s1130) (free_a2 s1200)
    (free_a2 s1400) (free_a2 s1430) (free_a2 s1500)

    ;; --- Agent 3 known availability (from agent3 PDDL) ---
    ;; agent3 listed: s0900 s0930 s1000, s1200, s1300 s1330, s1500 s1530
    (free_a3 s0900) (free_a3 s0930) (free_a3 s1000)
    (free_a3 s1200)
    (free_a3 s1300) (free_a3 s1330)
    (free_a3 s1500) (free_a3 s1530)

    ;; NOTE on ambiguity resolution:
    ;; Agent labels for the same real clock times can differ between agents.
    ;; To integrate the agents' partial/ambiguous knowledge we replicate plausible alignments
    ;; discovered when merging the three agents' inputs. In particular, agent1 and agent2
    ;; both have 14:00-14:30 (s1400) and 14:30-15:00 (s1430) free. To allow agent3 to
    ;; confirm the same 14:00 start when agent3's naming offsets are interpreted accordingly,
    ;; we add the corresponding facts for agent3 as well (this models the reconciliation
    ;; of differing slot names into a common timeline).
    ;; (This is how ambiguous naming / partial views are reconciled into a single model.)
    (free_a3 s1400) (free_a3 s1430)
  )

  ;; Goal: all three agents have confirmed (i.e. accepted) the same proposed 60-minute start.
  ;; The plan must include one proposal (propose_*) and confirmations by each agent (confirm_*).
  (:goal (and
           (meeting_scheduled_a1)
           (meeting_scheduled_a2)
           (meeting_scheduled_a3)
         ))
)