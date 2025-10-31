(define (problem blocks-problem-multi)
  (:domain blocksworld-multi)

  (:objects
    red_a blue_a orange_a yellow_a - block
    red_b blue_b orange_b yellow_b - block
    actor1 actor2 - agent
  )

  (:init
    (block red_a) (block blue_a) (block orange_a) (block yellow_a)
    (block red_b) (block blue_b) (block orange_b) (block yellow_b)

    (on red_a blue_a)
    (on blue_a orange_a)
    (on orange_a yellow_a)
    (on-table yellow_a)
    (clear red_a)
    (handempty actor1)

    (on orange_b blue_b)
    (on blue_b yellow_b)
    (on-table yellow_b)
    (on-table red_b)
    (clear red_b)
    (clear orange_b)
    (handempty actor2)
  )

  (:goal (and
    (on blue_a orange_a)
    (on orange_a yellow_a)
    (on yellow_a red_a)
    (on red_b orange_b)
    (on blue_b red_b)
  ))
)