(define (problem sokoban_instance_problem)
  (:domain sokoban_instance)
  (:objects
    pos_r2 pos_r3 pos_r219 pos_r264 - cell
    box1 - box
    player1 - player
  )

  (:init
    ;; compact ordering/clear-path encoding instead of enumerating every adjacent north_of link
    (between pos_r2 pos_r219 pos_r264)
    ;; the cell immediately south of the goal (player should end here after pushing to goal)
    (adjacent_south pos_r3 pos_r2)

    ;; actual instance state
    (at_box box1 pos_r219)
    (at_player player1 pos_r264)
  )

  (:goal (and
    (at_box box1 pos_r2)
  ))
)