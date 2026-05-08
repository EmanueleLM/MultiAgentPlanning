(define (problem sokoban-map0)
    (:domain sokoban)
    (:objects
        player_1 - player
        box_1 - box
        ;; Positions must map to the Sokoban grid cells
        pos_1 pos_2 pos_43 pos_90 pos_87 pos_88 - position
    )
    (:init
        ;; Initial positions
        (at player_1 pos_90)
        (at box_1 pos_87)
        
        ;; Goal position
        (is_goal pos_2)
        
        ;; Walls
        (is_wall pos_1)
        (is_wall pos_43)
        
        ;; Adjacency configurations based on map
        ;; Mapping vertical adjacency; include this carefully to reflect map
        (adjacent pos_87 pos_88) (adjacent pos_88 pos_87)
        (adjacent pos_88 pos_87)
    )
    (:goal
        (at box_1 pos_2)
    )
)