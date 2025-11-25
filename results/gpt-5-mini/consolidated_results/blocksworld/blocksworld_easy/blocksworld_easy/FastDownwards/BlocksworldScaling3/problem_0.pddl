(define (problem warehouse-problem1)
  (:domain warehouse-multiagent)

  (:objects
    picker1 - picker_robot
    stacker1 - stacker_robot

    item1 item2 item3 - item

    shelfA shelfB shelfC buffer1 pallet-area - location

    pallet1 - pallet

    p1 p2 p3 p4 p5 p6 - phase
  )

  (:init
    ;; initial robot positions
    (at picker1 shelfA)
    (at stacker1 pallet-area)

    ;; initial items on shelves
    (item-at item1 shelfA)
    (item-at item2 shelfB)
    (item-at item3 shelfC)

    ;; both robots start with free hands
    (free-hands picker1)
    (free-hands stacker1)

    ;; pallet location
    (pallet-at pallet1 pallet-area)

    ;; explicit phase order and bindings: strictly enforce pick1 -> stack1 -> pick2 -> stack2 -> pick3 -> stack3
    (current-phase p1)
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-next p3 p4)
    (phase-next p4 p5)
    (phase-next p5 p6)

    ;; phases mapped to items (conservative strict ordering)
    (phase-is-pick p1 item1)
    (phase-is-stack p2 item1)
    (phase-is-pick p3 item2)
    (phase-is-stack p4 item2)
    (phase-is-pick p5 item3)
    (phase-is-stack p6 item3)
  )

  (:goal (and
    ;; all items must be stacked and placed on the specified pallet
    (stacked item1)
    (stacked item2)
    (stacked item3)
    (item-on-pallet item1 pallet1)
    (item-on-pallet item2 pallet1)
    (item-on-pallet item3 pallet1)

    ;; planner must end in the final stack phase (enforces termination point)
    (current-phase p6)
  ))
)