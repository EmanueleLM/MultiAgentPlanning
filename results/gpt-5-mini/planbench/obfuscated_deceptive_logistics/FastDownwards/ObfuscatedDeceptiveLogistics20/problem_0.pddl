(define (problem multiagent-sequential-tasks-problem)
  (:domain multiagent-sequential-tasks)

  (:objects
    ; agents
    rover1 rover2 rover3 - agent

    ; sites/locations
    site-a site-b site-c - location

    ; explicit ordered slots (three slots to allow inspect -> repair -> report sequence)
    slot1 slot2 slot3 - slot
  )

  (:init
    ; slot successor chain enforces contiguity and prevents reordering across nonconsecutive slots
    (slot-successor slot1 slot2)
    (slot-successor slot2 slot3)

    ; initial agent locations in slot1
    (at rover1 site-a slot1)
    (at rover2 site-b slot1)
    (at rover3 site-c slot1)

    ; initially each agent is free in each slot (they may perform at most one action per slot;
    ; performing an action consumes the free token for that slot)
    (free rover1 slot1)
    (free rover1 slot2)
    (free rover1 slot3)

    (free rover2 slot1)
    (free rover2 slot2)
    (free rover2 slot3)

    (free rover3 slot1)
    (free rover3 slot2)
    (free rover3 slot3)
  )

  (:goal
    (and
      ; For every site, enforce the strict three-step contiguous sequence:
      ; inspected in slot1, repaired in slot2 (successor of slot1), reported in slot3 (successor of slot2).
      (inspected site-a slot1)
      (repaired site-a slot2)
      (reported site-a slot3)

      (inspected site-b slot1)
      (repaired site-b slot2)
      (reported site-b slot3)

      (inspected site-c slot1)
      (repaired site-c slot2)
      (reported site-c slot3)

      ; Mandated terminal locations for each agent at slot3 (fixes final agent positions).
      ; These are explicit terminal conditions so the solver cannot leave agents unconstrained.
      (at rover1 site-a slot3)
      (at rover2 site-b slot3)
      (at rover3 site-c slot3)
    )
  )
)