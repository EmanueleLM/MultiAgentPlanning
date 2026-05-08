(define (domain multi-agent-delivery)
  (:requirements :typing :strips :negative-preconditions)
  (:types agent location item timeslot)

  (:predicates
    (is-agent ?a - agent)
    (is-location ?l - location)
    (is-item ?i - item)
    (is-timeslot ?t - timeslot)

    (current ?t - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)

    (at ?a - agent ?l - location)
    (item-at ?i - item ?l - location)
    (has ?a - agent ?i - item)
    (delivered ?i - item ?l - location)
    (inspected ?i - item ?l - location)
  )

  (:action alice_pick_package1
    :parameters ()
    :precondition (and
      (is-agent alice)
      (is-item package1)
      (is-location depot)
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
      (is-agent alice)
      (is-location depot)
      (is-location siteA)
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
      (is-agent alice)
      (has alice package1)
      (at alice siteA)
      (is-location siteA)
      (current t2)
    )
    :effect (and
      (delivered package1 siteA)
      (not (has alice package1))
      (item-at package1 siteA)
    )
  )

  (:action bob_pick_package2
    :parameters ()
    :precondition (and
      (is-agent bob)
      (is-item package2)
      (is-location depot)
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
      (is-agent bob)
      (is-location depot)
      (is-location siteB)
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
      (is-agent bob)
      (has bob package2)
      (at bob siteB)
      (is-location siteB)
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
      (is-agent bob)
      (is-location siteA)
      (at bob siteA)
      (delivered package1 siteA)
      (is-item package1)
      (current t3)
    )
    :effect (and
      (inspected package1 siteA)
    )
  )

  (:action bob_inspect_siteB_package2_t3
    :parameters ()
    :precondition (and
      (is-agent bob)
      (is-location siteB)
      (at bob siteB)
      (delivered package2 siteB)
      (is-item package2)
      (current t3)
    )
    :effect (and
      (inspected package2 siteB)
    )
  )

  (:action system_advance_t1_t2
    :parameters ()
    :precondition (and
      (is-timeslot t1)
      (is-timeslot t2)
      (next t1 t2)
      (current t1)
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
      (is-timeslot t2)
      (is-timeslot t3)
      (next t2 t3)
      (current t2)
      (delivered package1 siteA)
      (delivered package2 siteB)
      (at alice siteA)
      (at bob siteB)
    )
    :effect (and
      (not (current t2))
      (current t3)
    )
  )

)