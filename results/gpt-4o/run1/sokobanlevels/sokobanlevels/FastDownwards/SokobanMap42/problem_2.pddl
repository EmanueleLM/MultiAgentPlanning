(define (problem sokoban-instance)
    (:domain sokoban)
    (:objects
        player1 - entity
        box1 - entity
        goal1 - position
        pos_0 pos_1 pos_2 pos_3 pos_4 pos_5 pos_6 pos_7 pos_8 pos_9 pos_10 
        pos_11 pos_12 pos_13 pos_14 pos_15 pos_16 pos_17 pos_18 pos_19 pos_20
        pos_21 pos_22 pos_23 pos_24 pos_25 pos_26 pos_27 pos_28 pos_29 pos_30
        pos_31 pos_32 pos_33 pos_34 pos_35 pos_36 pos_37 pos_38 pos_39 pos_40
        pos_41 pos_42 pos_43 pos_44 pos_45 - position
    )
    (:init
        (player player1)
        (box box1)
        (at player1 pos_43)
        (at box1 pos_45)
        (goal pos_0)
        
        ;; Define clear spaces and adjacencies
        (is_space pos_0)
        (is_space pos_1)
        (is_space pos_2)
        (is_space pos_3)
        (is_space pos_4)
        (is_space pos_5)
        (is_space pos_6)
        (is_space pos_7)
        (is_space pos_8)
        (is_space pos_9)
        (is_space pos_10)
        (is_space pos_11)
        (is_space pos_12)
        (is_space pos_13)
        (is_space pos_14)
        (is_space pos_15)
        (is_space pos_16)
        (is_space pos_17)
        (is_space pos_18)
        (is_space pos_19)
        (is_space pos_20)
        (is_space pos_21)
        (is_space pos_22)
        (is_space pos_23)
        (is_space pos_24)
        (is_space pos_25)
        (is_space pos_26)
        (is_space pos_27)
        (is_space pos_28)
        (is_space pos_29)
        (is_space pos_30)
        (is_space pos_31)
        (is_space pos_32)
        (is_space pos_33)
        (is_space pos_34)
        (is_space pos_35)
        (is_space pos_36)
        (is_space pos_37)
        (is_space pos_38)
        (is_space pos_39)
        (is_space pos_40)
        (is_space pos_41)
        (is_space pos_42)
        (is_space pos_43)
        (is_space pos_44)
        (is_space pos_45)

        ;; Define adjacencies
        (adjacent pos_43 pos_44)
        (adjacent pos_44 pos_45)
        ;; (more adjacencies may be needed depending on grid layout)
        
        ;; Define initial clear positions
        (clear pos_42)
        (clear pos_41)
        (clear pos_0)
    )
    
    (:goal
        (at box1 goal1)
    )
)