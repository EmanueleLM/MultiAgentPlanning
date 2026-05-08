(define (problem sokoban_instance)
  (:domain sokoban_jack_of_all_trades)
  (:objects
    player1 - agent
    box1 - box
    pos_player_start pos_box_start pos_goal - position
  )
  (:init
    (at_agent player1 pos_player_start)
    (at_box box1 pos_box_start)
    (goal pos_goal)
    (above pos_player_start pos_box_start)
    (above pos_box_start pos_goal)
    (clear_path pos_player_start pos_goal)
  )
  (:goal (and (at_box box1 pos_goal)))
)