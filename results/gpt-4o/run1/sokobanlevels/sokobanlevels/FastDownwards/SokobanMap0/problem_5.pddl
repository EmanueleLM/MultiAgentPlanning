(define (problem sokoban-map0)
    (:domain sokoban)
    (:objects
        player_1 - player
        box_1 - box
        pos_1 pos_2 pos_82 pos_83 pos_84 - position
    )
    (:init
        (at player_1 pos_84)
        (at box_1 pos_82)
        
        (is_goal pos_1)
        
        (is_wall pos_83)
        
        (adjacent pos_82 pos_83) (adjacent pos_83 pos_82)
        (adjacent pos_83 pos_84) (adjacent pos_84 pos_83)
    )
    (:goal
        (at box_1 pos_1)
    )
)