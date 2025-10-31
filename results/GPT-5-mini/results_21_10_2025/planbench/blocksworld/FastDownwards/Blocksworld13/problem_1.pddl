(define (problem blocks-problem-multi)
  (:domain blocksworld-multi)

  (:objects
    ; Blocks for actor1's private world
    red_a blue_a orange_a yellow_a - block
    ; Blocks for actor2's private world
    red_b blue_b orange_b yellow_b - block

    ; Agents
    actor1 actor2 - agent
  )

  (:init
    ; explicit block declarations
    (block red_a) (block blue_a) (block orange_a) (block yellow_a)
    (block red_b) (block blue_b) (block orange_b) (block yellow_b)

    ; === Actor1 private initial state ===
    ; stack: red_a on blue_a on orange_a on yellow_a on-table
    (on red_a blue_a)
    (on blue_a orange_a)
    (on orange_a yellow_a)
    (on-table yellow_a)
    (clear red_a)
    (handempty actor1)

    ; Note: clear facts for intermediate blocks (blue_a, orange_a, yellow_a) are
    ; not asserted here except where specified. The stack relations above imply they are not clear unless freed.

    ; === Actor2 private initial state ===
    ; stack: orange_b on blue_b on yellow_b on-table ; red_b on-table separate
    (on orange_b blue_b)
    (on blue_b yellow_b)
    (on-table yellow_b)
    (on-table red_b)
    (clear red_b)
    (clear orange_b)
    (handempty actor2)

    ; Other implicit negatives (e.g., not holding anything) are enforced by absence of holding facts.
  )

  ; Combined goal: both agents' private goals must be achieved in their own worlds.
  (:goal (and
    ; actor1 goal: blue_a on orange_a, orange_a on yellow_a, yellow_a on red_a
    (on blue_a orange_a)
    (on orange_a yellow_a)
    (on yellow_a red_a)

    ; actor2 goal: red_b on orange_b and blue_b on red_b
    (on red_b orange_b)
    (on blue_b red_b)
  ))
)