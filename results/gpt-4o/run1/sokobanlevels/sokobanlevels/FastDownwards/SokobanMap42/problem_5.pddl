(define (problem sokoban-instance)
    (:domain sokoban)
    (:objects
        player1 - entity
        box1 - entity
        pos_0 pos_43 pos_44 pos_45 - position
    )
    (:init
        (player player1)
        (box box1)
        (at player1 pos_44)
        (at box1 pos_43)
        (goal pos_0)

        ;; Define clear spaces and adjacencies
        (is_space pos_0)
        (is_space pos_43)
        (is_space pos_44)
        (is_space pos_45)
        
        ;; Define adjacencies
        (adjacent pos_44 pos_43)
        (adjacent pos_43 pos_44)
        (adjacent pos_44 pos_45)
        (adjacent pos_45 pos_44)
        
        ;; Define initial clear positions
        (clear pos_0)
        (clear pos_45)
    )

    (:goal
        (at box1 pos_0)
    )
)