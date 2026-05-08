(define (domain multi-agent-delivery)
  (:requirements :typing :strips :negative-preconditions)
  (:types agent location item timeslot)

  (:predicates
    (agent ?a - agent)
    (location ?l - location)
    (item ?i - item)
    (timeslot ?t - timeslot)

    ; current global timeslot (exactly one true at a time)
    (current ?t - timeslot)

    ; temporal ordering relation between timeslots
    (next ?t1 - timeslot ?t2 - timeslot)

    ; dynamic state
    (at ?a - agent ?l - location)            ; agent location
    (item-at ?i - item ?l - location)        ; where item currently is (before pickup or after drop if applicable)
    (has ?a - agent ?i - item)               ; agent possesses item
    (delivered ?i - item ?l - location)      ; item delivered to location
    (inspected ?i - item ?l - location)      ; item inspected at location
  )

  ; -------------------------
  ; Actions from agent: alice
  ; -------------------------
  (:action alice_pick_package1
    :parameters ()
    :precondition (and
      (agent alice)
      (item package1)
      (location depot)
      (item-at package1 depot)
      (at alice depot)
      (current t1)
    )
    :effect (and
      (has alice package1)
      (not (item-at package1 depot))
    )
  )

  (:action alice_move_to_siteA_t2
    :parameters ()
    :precondition (and
      (agent alice)
      (location depot)
      (location siteA)
      (at alice depot)
      (current t2)
    )
    :effect (and
      (at alice siteA)
      (not (at alice depot))
    )
  )

  (:action alice_deliver_package1_siteA
    :parameters ()
    :precondition (and
      (agent alice)
      (has alice package1)
      (at alice siteA)
      (location siteA)
      (current t2)
    )
    :effect (and
      (delivered package1 siteA)
      (not (has alice package1))
      (item-at package1 siteA)
    )
  )

  ; -------------------------
  ; Actions from agent: bob
  ; -------------------------
  (:action bob_pick_package2
    :parameters ()
    :precondition (and
      (agent bob)
      (item package2)
      (location depot)
      (item-at package2 depot)
      (at bob depot)
      (current t1)
    )
    :effect (and
      (has bob package2)
      (not (item-at package2 depot))
    )
  )

  (:action bob_move_to_siteB_t2
    :parameters ()
    :precondition (and
      (agent bob)
      (location depot)
      (location siteB)
      (at bob depot)
      (current t2)
    )
    :effect (and
      (at bob siteB)
      (not (at bob depot))
    )
  )

  (:action bob_deliver_package2_siteB
    :parameters ()
    :precondition (and
      (agent bob)
      (has bob package2)
      (at bob siteB)
      (location siteB)
      (current t2)
    )
    :effect (and
      (delivered package2 siteB)
      (not (has bob package2))
      (item-at package2 siteB)
    )
  )

  (:action bob_inspect_siteA_package1_t3
    :parameters ()
    :precondition (and
      (agent bob)
      (location siteA)
      (at bob siteA)
      (delivered package1 siteA)
      (item package1)
      (current t3)
    )
    :effect (and
      (inspected package1 siteA)
    )
  )

  (:action bob_inspect_siteB_package2_t3
    :parameters ()
    :precondition (and
      (agent bob)
      (location siteB)
      (at bob siteB)
      (delivered package2 siteB)
      (item package2)
      (current t3)
    )
    :effect (and
      (inspected package2 siteB)
    )
  )

  ; -------------------------
  ; System actions (time advancement)
  ; Named with 'system' prefix to keep agent-origin annotations distinct
  ; -------------------------
  (:action system_advance_t1_t2
    :parameters ()
    :precondition (and
      (timeslot t1)
      (timeslot t2)
      (next t1 t2)
      (current t1)
      ; enforce that all t1 tasks are completed before advancing
      (has alice package1)
      (has bob package2)
    )
    :effect (and
      (not (current t1))
      (current t2)
    )
  )

  (:action system_advance_t2_t3
    :parameters ()
    :precondition (and
      (timeslot t2)
      (timeslot t3)
      (next t2 t3)
      (current t2)
      ; enforce that all t2 tasks are completed before advancing
      (delivered package1 siteA)
      (delivered package2 siteB)
      ; additionally require agents to be located appropriately at end of t2
      (at alice siteA)
      (at bob siteB)
    )
    :effect (and
      (not (current t2))
      (current t3)
    )
  )

)