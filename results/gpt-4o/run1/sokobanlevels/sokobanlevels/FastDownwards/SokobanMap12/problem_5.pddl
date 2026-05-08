(define (problem sokoban-instance)
    (:domain sokoban)

    (:objects
        player1 - player
        box1 - box
        square_1 square_2 square_3 square_4 square_5 square_6 square_7 square_8 
        square_9 square_10 square_11 square_12 square_13 square_14 square_15 
        square_16 square_17 square_18 square_19 square_20 square_21 
    )

    (:init
        (at player1 square_21)
        (box_at box1 square_17)
        (goal square_2)
        
        (adjacent square_1 square_2) (adjacent square_2 square_3)
        (adjacent square_3 square_4) (adjacent square_4 square_5)
        (adjacent square_5 square_6) (adjacent square_6 square_7)
        (adjacent square_7 square_8) (adjacent square_8 square_9)
        (adjacent square_9 square_10) (adjacent square_10 square_11)
        (adjacent square_11 square_12) (adjacent square_12 square_13)
        (adjacent square_13 square_14) (adjacent square_14 square_15)
        (adjacent square_15 square_16) (adjacent square_16 square_17)
        (adjacent square_17 square_18) (adjacent square_18 square_19)
        (adjacent square_19 square_20) (adjacent square_20 square_21)

        (free square_2)
        (free square_3)
        (free square_4)
        (free square_5)
        (free square_6)
        (free square_7)
        (free square_8)
        (free square_9)
        (free square_10)
        (free square_11)
        (free square_12)
        (free square_13)
        (free square_14)
        (free square_15)
        (free square_16)
        (free square_17)
        (free square_18)
        (free square_19)
        (free square_20)
    )

    (:goal
        (box_at box1 square_2)
    )
)