(define (problem orchestrator-multiagent-problem)
  (:domain orchestrator_multiagent)

  ; ----- Documentation of canonicalization choices (human-readable comments) -----
  ; Choices made to reconcile and canonicalize actor_A and actor_B structured facts:
  ; - Agents: canonicalized to objects "actorA" and "actorB".
  ; - Each named action (paltry, sip, clip, wretched, memory, tightfisted) is modelled
  ;   as an instantaneous action in the domain with a corresponding "done-<action>"
  ;   predicate to mark completion.
  ; - Each action requires a concrete item (an object of type item). For clarity and to
  ;   keep multi-agent contributions distinct, items are named to reflect the action they
  ;   enable: item-paltry, item-sip, item-clip, item-wretched, item-memory, item-tightfisted.
  ; - Ownership (has ...) is set so that actorA is responsible for the first three actions
  ;   (paltry, sip, clip) and actorB is responsible for the last three (wretched, memory, tightfisted).
  ;   This choice keeps actor contributions distinct where the inputs represented different fragments.
  ; - Time is modelled by explicit discrete slots (slot1..slot3). Natural-language timing
  ;   preferences (avoid / would rather / earliest) are encoded as hard constraints by setting
  ;   specific slots to (unavailable ...). In this problem slot1 is marked unavailable to
  ;   enforce "earliest" = slot2 where that constraint applied.
  ; - No additional availability beyond the structured inputs was created except the minimum
  ;   set of slots needed to schedule all actions. If your sources provide different slots or
  ;   different unavailable slots, replace slot declarations / facts accordingly.
  ; ----------------------------------------------------------------------------------

  (:objects
    actorA actorB - agent

    ; Items associated with each action (one-to-one mapping chosen to keep actions distinct)
    item-paltry item-sip item-clip item-wretched item-memory item-tightfisted - item

    ; Discrete time slots used to schedule each instantaneous action
    slot1 slot2 slot3 - slot
  )

  (:init
    ; Ownership / capability facts (integrated from actor_A and actor_B fragments)
    ; actorA provides items for paltry, sip, clip
    (has actorA item-paltry)
    (has actorA item-sip)
    (has actorA item-clip)

    ; actorB provides items for wretched, memory, tightfisted
    (has actorB item-wretched)
    (has actorB item-memory)
    (has actorB item-tightfisted)

    ; Slot availability: slot1 is unavailable to encode "avoid / would rather / earliest"
    ; constraints expressed in the source summaries. Earliest allowed slot is therefore slot2.
    (unavailable slot1)

    ; Other slots are free initially
    (free-slot slot2)
    (free-slot slot3)

    ; No items used yet
    ; (item-used ...) are false by default; not listed in init.
  )

  ; Goal: all six named actions must be completed by the corresponding agents.
  ; This enforces the preferences/requirements from both actors as hard constraints.
  (:goal
    (and
      (done-paltry actorA)
      (done-sip actorA)
      (done-clip actorA)
      (done-wretched actorB)
      (done-memory actorB)
      (done-tightfisted actorB)
    )
  )

  ; NOTE: No metric or optimization specified. FastDownward will try to find any plan
  ; satisfying the constraints. The encoding enforces earliest-slot constraints by marking
  ; slot1 unavailable; thus the planner must use slot2/slot3 to schedule actions.
)