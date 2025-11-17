(define (problem field-ops-problem)
  (:domain field-ops)

  (:objects
    ;; agents
    tech1 drone1 - agent

    ;; tasks
    inspect-siteA repair-siteA inspect-siteB - task

    ;; locations
    base siteA siteB - location

    ;; days (explicit ordered slots; contiguity enforced by day-ready and day-succ)
    day1 day2 day3 - day
  )

  (:init
    ;; type markers (helpful but not relied on by planner)
    (agent-type tech1)
    (agent-type drone1)
    (task-type inspect-siteA)
    (task-type repair-siteA)
    (task-type inspect-siteB)
    (location-type base)
    (location-type siteA)
    (location-type siteB)
    (day-type day1)
    (day-type day2)
    (day-type day3)

    ;; initial agent positions
    (at tech1 base)
    (at drone1 base)

    ;; initial capabilities / status
    (has-tools tech1)           ;; tech1 has the necessary tools to repair
    (can-repair tech1)          ;; only tech1 can repair (auditor-corrected)
    (can-inspect tech1)         ;; tech1 may inspect if needed
    (can-inspect drone1)        ;; drone1 may inspect but cannot repair
    ;; drone initially not charged; must charge at base before first inspect
    (not (charged drone1))

    ;; tasks and locations
    (task-at inspect-siteA siteA)
    (task-at repair-siteA siteA)  ;; repair is at the same physical site as the inspection (same siteA)
    (task-at inspect-siteB siteB)

    ;; scheduling: unique one task per day to enforce simple day progression
    (scheduled inspect-siteA day1)
    (scheduled repair-siteA day2)
    (scheduled inspect-siteB day3)

    ;; day succession: explicit chain; last day loops to itself to keep a defined successor
    (day-succ day1 day2)
    (day-succ day2 day3)
    (day-succ day3 day3)

    ;; start with day1 ready
    (day-ready day1)

    ;; ensure tasks start uninspected/unrepaired by omission (no inspected/repaired facts)
  )

  (:goal
    (and
      ;; All mandated terminal task conditions:
      (inspected inspect-siteA)
      (repaired repair-siteA)
      (inspected inspect-siteB)

      ;; Final locations mandated as terminal conditions:
      (at tech1 base)
      (at drone1 base)
    )
  )
)