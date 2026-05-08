; -----------------------------------------------------------------------------
; Auditor comment log (applied corrections)
; - Enforced time as explicit timeslot objects and a unique (current ...) predicate
; - Introduced system_advance_t1_t2 and system_advance_t2_t3 actions that require
;   completion of all tasks in a timeslot before advancing (prevents reordering)
; - Converted soft preferences (earliest, would rather) into hard constraints by
;   making actions require specific current timeslots
; - Removed any token/penalty or post-hoc "pay shortfall" constructs; violations
;   are impossible because advancement is blocked until required predicates hold
; - Declared all types and objects explicitly and fixed naming mismatches (alice/bob)
; -----------------------------------------------------------------------------

(define (problem multi-agent-delivery-problem)
  (:domain multi-agent-delivery)

  (:objects
    alice bob - agent

    depot siteA siteB - location

    package1 package2 - item

    t1 t2 t3 - timeslot
  )

  (:init
    ; types assertions
    (agent alice)
    (agent bob)

    (location depot)
    (location siteA)
    (location siteB)

    (item package1)
    (item package2)

    (timeslot t1)
    (timeslot t2)
    (timeslot t3)

    ; temporal ordering (explicit contiguous slots; contiguity enforced by system_advance actions)
    (next t1 t2)
    (next t2 t3)

    ; initial current time is t1
    (current t1)

    ; initial agent positions at depot
    (at alice depot)
    (at bob depot)

    ; initial item positions at depot
    (item-at package1 depot)
    (item-at package2 depot)
  )

  ; Final terminal conditions mandated as hard goals:
  ; - Both packages delivered to their target sites
  ; - Both deliveries inspected
  ; - Agents end at the delivery sites
  ; - Timeline advanced up to and including timeslot t3 (current t3)
  (:goal
    (and
      (delivered package1 siteA)
      (delivered package2 siteB)
      (inspected package1 siteA)
      (inspected package2 siteB)
      (at alice siteA)
      (at bob siteB)
      (current t3)
    )
  )
)