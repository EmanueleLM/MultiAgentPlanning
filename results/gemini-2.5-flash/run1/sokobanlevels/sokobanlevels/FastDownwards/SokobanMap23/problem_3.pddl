(define (problem sokobanmap23-problem)
  (:domain sokoban-sokobanmap23)
  (:objects
    player1 - player
    box1 - box
    loc_1_1 loc_1_2 loc_1_3 loc_1_4 loc_1_5 loc_1_6 loc_1_7 loc_1_8 loc_1_9 loc_1_10
    loc_1_11 loc_1_12 loc_1_13 loc_1_14 loc_1_15 loc_1_16 loc_1_17 loc_1_18 loc_1_19 loc_1_20
    loc_1_21 loc_1_22 loc_1_23 loc_1_24 loc_1_25 loc_1_26 loc_1_27 loc_1_28 loc_1_29 loc_1_30
    loc_1_31 loc_1_32 loc_1_33 loc_1_34 loc_1_35 loc_1_36 loc_1_37 loc_1_38 loc_1_39 loc_1_40
    loc_1_41 loc_1_42 loc_1_43 loc_1_44 loc_1_45 loc_1_46 loc_1_47 loc_1_48 loc_1_49 loc_1_50
    loc_1_51 loc_1_52 loc_1_53 loc_1_54 - location
  )
  (:init
    (player_at player1 loc_1_1)
    (box_at box1 loc_1_51)
    (is_goal loc_1_54)

    (= (total-cost) 0)

    ; Locations that are initially clear (not occupied by player or box)
    (is_clear loc_1_2) (is_clear loc_1_3) (is_clear loc_1_4) (is_clear loc_1_5)
    (is_clear loc_1_6) (is_clear loc_1_7) (is_clear loc_1_8) (is_clear loc_1_9) (is_clear loc_1_10)
    (is_clear loc_1_11) (is_clear loc_1_12) (is_clear loc_1_13) (is_clear loc_1_14) (is_clear loc_1_15)
    (is_clear loc_1_16) (is_clear loc_1_17) (is_clear loc_1_18) (is_clear loc_1_19) (is_clear loc_1_20)
    (is_clear loc_1_21) (is_clear loc_1_22) (is_clear loc_1_23) (is_clear loc_1_24) (is_clear loc_1_25)
    (is_clear loc_1_26) (is_clear loc_1_27) (is_clear loc_1_28) (is_clear loc_1_29) (is_clear loc_1_30)
    (is_clear loc_1_31) (is_clear loc_1_32) (is_clear loc_1_33) (is_clear loc_1_34) (is_clear loc_1_35)
    (is_clear loc_1_36) (is_clear loc_1_37) (is_clear loc_1_38) (is_clear loc_1_39) (is_clear loc_1_40)
    (is_clear loc_1_41) (is_clear loc_1_42) (is_clear loc_1_43) (is_clear loc_1_44) (is_clear loc_1_45)
    (is_clear loc_1_46) (is_clear loc_1_47) (is_clear loc_1_48) (is_clear loc_1_49) (is_clear loc_1_50)
    (is_clear loc_1_52) (is_clear loc_1_53) (is_clear loc_1_54)

    ; Adjacency (vertical only, as per map structure)
    ; Down connections (from l1 to l2, where l2 is below l1)
    (adj_down loc_1_1 loc_1_2) (adj_down loc_1_2 loc_1_3) (adj_down loc_1_3 loc_1_4) (adj_down loc_1_4 loc_1_5)
    (adj_down loc_1_5 loc_1_6) (adj_down loc_1_6 loc_1_7) (adj_down loc_1_7 loc_1_8) (adj_down loc_1_8 loc_1_9)
    (adj_down loc_1_9 loc_1_10) (adj_down loc_1_10 loc_1_11) (adj_down loc_1_11 loc_1_12) (adj_down loc_1_12 loc_1_13)
    (adj_down loc_1_13 loc_1_14) (adj_down loc_1_14 loc_1_15) (adj_down loc_1_15 loc_1_16) (adj_down loc_1_16 loc_1_17)
    (adj_down loc_1_17 loc_1_18) (adj_down loc_1_18 loc_1_19) (adj_down loc_1_19 loc_1_20) (adj_down loc_1_20 loc_1_21)
    (adj_down loc_1_21 loc_1_22) (adj_down loc_1_22 loc_1_23) (adj_down loc_1_23 loc_1_24) (adj_down loc_1_24 loc_1_25)
    (adj_down loc_1_25 loc_1_26) (adj_down loc_1_26 loc_1_27) (adj_down loc_1_27 loc_1_28) (adj_down loc_1_28 loc_1_29)
    (adj_down loc_1_29 loc_1_30) (adj_down loc_1_30 loc_1_31) (adj_down loc_1_31 loc_1_32) (adj_down loc_1_32 loc_1_33)
    (adj_down loc_1_33 loc_1_34) (adj_down loc_1_34 loc_1_35) (adj_down loc_1_35 loc_1_36) (adj_down loc_1_36 loc_1_37)
    (adj_down loc_1_37 loc_1_38) (adj_down loc_1_38 loc_1_39) (adj_down loc_1_39 loc_1_40) (adj_down loc_1_40 loc_1_41)
    (adj_down loc_1_41 loc_1_42) (adj_down loc_1_42 loc_1_43) (adj_down loc_1_43 loc_1_44) (adj_down loc_1_44 loc_1_45)
    (adj_down loc_1_45 loc_1_46) (adj_down loc_1_46 loc_1_47) (adj_down loc_1_47 loc_1_48) (adj_down loc_1_48 loc_1_49)
    (adj_down loc_1_49 loc_1_50) (adj_down loc_1_50 loc_1_51) (adj_down loc_1_51 loc_1_52) (adj_down loc_1_52 loc_1_53)
    (adj_down loc_1_53 loc_1_54)

    ; Up connections (from l1 to l2, where l2 is above l1)
    (adj_up loc_1_2 loc_1_1) (adj_up loc_1_3 loc_1_2) (adj_up loc_1_4 loc_1_3) (adj_up loc_1_5 loc_1_4)
    (adj_up loc_1_6 loc_1_5) (adj_up loc_1_7 loc_1_6) (adj_up loc_1_8 loc_1_7) (adj_up loc_1_9 loc_1_8)
    (adj_up loc_1_10 loc_1_9) (adj_up loc_1_11 loc_1_10) (adj_up loc_1_12 loc_1_11) (adj_up loc_1_13 loc_1_12)
    (adj_up loc_1_14 loc_1_13) (adj_up loc_1_15 loc_1_14) (adj_up loc_1_16 loc_1_15) (adj_up loc_1_17 loc_1_16)
    (adj_up loc_1_18 loc_1_17) (adj_up loc_1_19 loc_1_18) (adj_up loc_1_20 loc_1_19) (adj_up loc_1_21 loc_1_20)
    (adj_up loc_1_22 loc_1_21) (adj_up loc_1_23 loc_1_22) (adj_up loc_1_24 loc_1_23) (adj_up loc_1_25 loc_1_24)
    (adj_up loc_1_26 loc_1_25) (adj_up loc_1_27 loc_1_26) (adj_up loc_1_28 loc_1_27) (adj_up loc_1_29 loc_1_28)
    (adj_up loc_1_30 loc_1_29) (adj_up loc_1_31 loc_1_30) (adj_up loc_1_32 loc_1_31) (adj_up loc_1_33 loc_1_32)
    (adj_up loc_1_34 loc_1_33) (adj_up loc_1_35 loc_1_34) (adj_up loc_1_36 loc_1_35) (adj_up loc_1_37 loc_1_36)
    (adj_up loc_1_38 loc_1_37) (adj_up loc_1_39 loc_1_38) (adj_up loc_1_40 loc_1_39) (adj_up loc_1_41 loc_1_40)
    (adj_up loc_1_42 loc_1_41) (adj_up loc_1_43 loc_1_42) (adj_up loc_1_44 loc_1_43) (adj_up loc_1_45 loc_1_44)
    (adj_up loc_1_46 loc_1_45) (adj_up loc_1_47 loc_1_46) (adj_up loc_1_48 loc_1_47) (adj_up loc_1_49 loc_1_48)
    (adj_up loc_1_50 loc_1_49) (adj_up loc_1_51 loc_1_50) (adj_up loc_1_52 loc_1_51) (adj_up loc_1_53 loc_1_52)
    (adj_up loc_1_54 loc_1_53)
  )
  (:goal (and
    (box_at box1 loc_1_54)
  ))
  (:metric minimize (total-cost))
)