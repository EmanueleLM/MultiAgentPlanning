(define (problem sokoban-map26-problem)
    (:domain sokoban-map26)
    (:objects
        player1 - player
        box1 - box
        ;; Locations (3 columns, 64 rows)
        loc-0-0 loc-0-1 loc-0-2 loc-0-3 loc-0-4 loc-0-5 loc-0-6 loc-0-7 loc-0-8 loc-0-9 loc-0-10 loc-0-11 loc-0-12 loc-0-13 loc-0-14 loc-0-15 loc-0-16 loc-0-17 loc-0-18 loc-0-19 loc-0-20 loc-0-21 loc-0-22 loc-0-23 loc-0-24 loc-0-25 loc-0-26 loc-0-27 loc-0-28 loc-0-29 loc-0-30 loc-0-31 loc-0-32 loc-0-33 loc-0-34 loc-0-35 loc-0-36 loc-0-37 loc-0-38 loc-0-39 loc-0-40 loc-0-41 loc-0-42 loc-0-43 loc-0-44 loc-0-45 loc-0-46 loc-0-47 loc-0-48 loc-0-49 loc-0-50 loc-0-51 loc-0-52 loc-0-53 loc-0-54 loc-0-55 loc-0-56 loc-0-57 loc-0-58 loc-0-59 loc-0-60 loc-0-61 loc-0-62 loc-0-63
        loc-1-0 loc-1-1 loc-1-2 loc-1-3 loc-1-4 loc-1-5 loc-1-6 loc-1-7 loc-1-8 loc-1-9 loc-1-10 loc-1-11 loc-1-12 loc-1-13 loc-1-14 loc-1-15 loc-1-16 loc-1-17 loc-1-18 loc-1-19 loc-1-20 loc-1-21 loc-1-22 loc-1-23 loc-1-24 loc-1-25 loc-1-26 loc-1-27 loc-1-28 loc-1-29 loc-1-30 loc-1-31 loc-1-32 loc-1-33 loc-1-34 loc-1-35 loc-1-36 loc-1-37 loc-1-38 loc-1-39 loc-1-40 loc-1-41 loc-1-42 loc-1-43 loc-1-44 loc-1-45 loc-1-46 loc-1-47 loc-1-48 loc-1-49 loc-1-50 loc-1-51 loc-1-52 loc-1-53 loc-1-54 loc-1-55 loc-1-56 loc-1-57 loc-1-58 loc-1-59 loc-1-60 loc-1-61 loc-1-62 loc-1-63
        loc-2-0 loc-2-1 loc-2-2 loc-2-3 loc-2-4 loc-2-5 loc-2-6 loc-2-7 loc-2-8 loc-2-9 loc-2-10 loc-2-11 loc-2-12 loc-2-13 loc-2-14 loc-2-15 loc-2-16 loc-2-17 loc-2-18 loc-2-19 loc-2-20 loc-2-21 loc-2-22 loc-2-23 loc-2-24 loc-2-25 loc-2-26 loc-2-27 loc-2-28 loc-2-29 loc-2-30 loc-2-31 loc-2-32 loc-2-33 loc-2-34 loc-2-35 loc-2-36 loc-2-37 loc-2-38 loc-2-39 loc-2-40 loc-2-41 loc-2-42 loc-2-43 loc-2-44 loc-2-45 loc-2-46 loc-2-47 loc-2-48 loc-2-49 loc-2-50 loc-2-51 loc-2-52 loc-2-53 loc-2-54 loc-2-55 loc-2-56 loc-2-57 loc-2-58 loc-2-59 loc-2-60 loc-2-61 loc-2-62 loc-2-63 - location
    )
    (:init
        (at player1 loc-1-62)
        (at box1 loc-1-51)
        (is_goal loc-1-1)
        (= (total-cost) 0)

        ;; Walls (Col 0 and Col 2 are entirely walls, along with row 0 and row 63 for Col 1)
        (is_wall loc-0-0) (is_wall loc-0-1) (is_wall loc-0-2) (is_wall loc-0-3) (is_wall loc-0-4) (is_wall loc-0-5) (is_wall loc-0-6) (is_wall loc-0-7) (is_wall loc-0-8) (is_wall loc-0-9)
        (is_wall loc-0-10) (is_wall loc-0-11) (is_wall loc-0-12) (is_wall loc-0-13) (is_wall loc-0-14) (is_wall loc-0-15) (is_wall loc-0-16) (is_wall loc-0-17) (is_wall loc-0-18) (is_wall loc-0-19)
        (is_wall loc-0-20) (is_wall loc-0-21) (is_wall loc-0-22) (is_wall loc-0-23) (is_wall loc-0-24) (is_wall loc-0-25) (is_wall loc-0-26) (is_wall loc-0-27) (is_wall loc-0-28) (is_wall loc-0-29)
        (is_wall loc-0-30) (is_wall loc-0-31) (is_wall loc-0-32) (is_wall loc-0-33) (is_wall loc-0-34) (is_wall loc-0-35) (is_wall loc-0-36) (is_wall loc-0-37) (is_wall loc-0-38) (is_wall loc-0-39)
        (is_wall loc-0-40) (is_wall loc-0-41) (is_wall loc-0-42) (is_wall loc-0-43) (is_wall loc-0-44) (is_wall loc-0-45) (is_wall loc-0-46) (is_wall loc-0-47) (is_wall loc-0-48) (is_wall loc-0-49)
        (is_wall loc-0-50) (is_wall loc-0-51) (is_wall loc-0-52) (is_wall loc-0-53) (is_wall loc-0-54) (is_wall loc-0-55) (is_wall loc-0-56) (is_wall loc-0-57) (is_wall loc-0-58) (is_wall loc-0-59)
        (is_wall loc-0-60) (is_wall loc-0-61) (is_wall loc-0-62) (is_wall loc-0-63)

        (is_wall loc-2-0) (is_wall loc-2-1) (is_wall loc-2-2) (is_wall loc-2-3) (is_wall loc-2-4) (is_wall loc-2-5) (is_wall loc-2-6) (is_wall loc-2-7) (is_wall loc-2-8) (is_wall loc-2-9)
        (is_wall loc-2-10) (is_wall loc-2-11) (is_wall loc-2-12) (is_wall loc-2-13) (is_wall loc-2-14) (is_wall loc-2-15) (is_wall loc-2-16) (is_wall loc-2-17) (is_wall loc-2-18) (is_wall loc-2-19)
        (is_wall loc-2-20) (is_wall loc-2-21) (is_wall loc-2-22) (is_wall loc-2-23) (is_wall loc-2-24) (is_wall loc-2-25) (is_wall loc-2-26) (is_wall loc-2-27) (is_wall loc-2-28) (is_wall loc-2-29)
        (is_wall loc-2-30) (is_wall loc-2-31) (is_wall loc-2-32) (is_wall loc-2-33) (is_wall loc-2-34) (is_wall loc-2-35) (is_wall loc-2-36) (is_wall loc-2-37) (is_wall loc-2-38) (is_wall loc-2-39)
        (is_wall loc-2-40) (is_wall loc-2-41) (is_wall loc-2-42) (is_wall loc-2-43) (is_wall loc-2-44) (is_wall loc-2-45) (is_wall loc-2-46) (is_wall loc-2-47) (is_wall loc-2-48) (is_wall loc-2-49)
        (is_wall loc-2-50) (is_wall loc-2-51) (is_wall loc-2-52) (is_wall loc-2-53) (is_wall loc-2-54) (is_wall loc-2-55) (is_wall loc-2-56) (is_wall loc-2-57) (is_wall loc-2-58) (is_wall loc-2-59)
        (is_wall loc-2-60) (is_wall loc-2-61) (is_wall loc-2-62) (is_wall loc-2-63)

        (is_wall loc-1-0)
        (is_wall loc-1-63)

        ;; Connectivity for the playable column (Col 1, rows 1-62)
        ;; connected_up: from loc-1-y to loc-1-(y-1)
        (connected_up loc-1-2 loc-1-1) (connected_up loc-1-3 loc-1-2) (connected_up loc-1-4 loc-1-3) (connected_up loc-1-5 loc-1-4) (connected_up loc-1-6 loc-1-5) (connected_up loc-1-7 loc-1-6) (connected_up loc-1-8 loc-1-7) (connected_up loc-1-9 loc-1-8) (connected_up loc-1-10 loc-1-9)
        (connected_up loc-1-11 loc-1-10) (connected_up loc-1-12 loc-1-11) (connected_up loc-1-13 loc-1-12) (connected_up loc-1-14 loc-1-13) (connected_up loc-1-15 loc-1-14) (connected_up loc-1-16 loc-1-15) (connected_up loc-1-17 loc-1-16) (connected_up loc-1-18 loc-1-17) (connected_up loc-1-19 loc-1-18) (connected_up loc-1-20 loc-1-19)
        (connected_up loc-1-21 loc-1-20) (connected_up loc-1-22 loc-1-21) (connected_up loc-1-23 loc-1-22) (connected_up loc-1-24 loc-1-23) (connected_up loc-1-25 loc-1-24) (connected_up loc-1-26 loc-1-25) (connected_up loc-1-27 loc-1-26) (connected_up loc-1-28 loc-1-27) (connected_up loc-1-29 loc-1-28) (connected_up loc-1-30 loc-1-29)
        (connected_up loc-1-31 loc-1-30) (connected_up loc-1-32 loc-1-31) (connected_up loc-1-33 loc-1-32) (connected_up loc-1-34 loc-1-33) (connected_up loc-1-35 loc-1-34) (connected_up loc-1-36 loc-1-35) (connected_up loc-1-37 loc-1-36) (connected_up loc-1-38 loc-1-37) (connected_up loc-1-39 loc-1-38) (connected_up loc-1-40 loc-1-39)
        (connected_up loc-1-41 loc-1-40) (connected_up loc-1-42 loc-1-41) (connected_up loc-1-43 loc-1-42) (connected_up loc-1-44 loc-1-43) (connected_up loc-1-45 loc-1-44) (connected_up loc-1-46 loc-1-45) (connected_up loc-1-47 loc-1-46) (connected_up loc-1-48 loc-1-47) (connected_up loc-1-49 loc-1-48) (connected_up loc-1-50 loc-1-49)
        (connected_up loc-1-51 loc-1-50) (connected_up loc-1-52 loc-1-51) (connected_up loc-1-53 loc-1-52) (connected_up loc-1-54 loc-1-53) (connected_up loc-1-55 loc-1-54) (connected_up loc-1-56 loc-1-55) (connected_up loc-1-57 loc-1-56) (connected_up loc-1-58 loc-1-57) (connected_up loc-1-59 loc-1-58) (connected_up loc-1-60 loc-1-59)
        (connected_up loc-1-61 loc-1-60) (connected_up loc-1-62 loc-1-61)

        ;; connected_down: from loc-1-y to loc-1-(y+1)
        (connected_down loc-1-1 loc-1-2) (connected_down loc-1-2 loc-1-3) (connected_down loc-1-3 loc-1-4) (connected_down loc-1-4 loc-1-5) (connected_down loc-1-5 loc-1-6) (connected_down loc-1-6 loc-1-7) (connected_down loc-1-7 loc-1-8) (connected_down loc-1-8 loc-1-9) (connected_down loc-1-9 loc-1-10)
        (connected_down loc-1-10 loc-1-11) (connected_down loc-1-11 loc-1-12) (connected_down loc-1-12 loc-1-13) (connected_down loc-1-13 loc-1-14) (connected_down loc-1-14 loc-1-15) (connected_down loc-1-15 loc-1-16) (connected_down loc-1-16 loc-1-17) (connected_down loc-1-17 loc-1-18) (connected_down loc-1-18 loc-1-19) (connected_down loc-1-19 loc-1-20)
        (connected_down loc-1-21 loc-1-22) (connected_down loc-1-22 loc-1-23) (connected_down loc-1-23 loc-1-24) (connected_down loc-1-24 loc-1-25) (connected_down loc-1-25 loc-1-26) (connected_down loc-1-26 loc-1-27) (connected_down loc-1-27 loc-1-28) (connected_down loc-1-28 loc-1-29) (connected_down loc-1-29 loc-1-30) (connected_down loc-1-30 loc-1-31)
        (connected_down loc-1-31 loc-1-32) (connected_down loc-1-32 loc-1-33) (connected_down loc-1-33 loc-1-34) (connected_down loc-1-34 loc-1-35) (connected_down loc-1-35 loc-1-36) (connected_down loc-1-36 loc-1-37) (connected_down loc-1-37 loc-1-38) (connected_down loc-1-38 loc-1-39) (connected_down loc-1-39 loc-1-40) (connected_down loc-1-40 loc-1-41)
        (connected_down loc-1-41 loc-1-42) (connected_down loc-1-42 loc-1-43) (connected_down loc-1-43 loc-1-44) (connected_down loc-1-44 loc-1-45) (connected_down loc-1-45 loc-1-46) (connected_down loc-1-46 loc-1-47) (connected_down loc-1-47 loc-1-48) (connected_down loc-1-48 loc-1-49) (connected_down loc-1-49 loc-1-50) (connected_down loc-1-50 loc-1-51)
        (connected_down loc-1-51 loc-1-52) (connected_down loc-1-52 loc-1-53) (connected_down loc-1-53 loc-1-54) (connected_down loc-1-54 loc-1-55) (connected_down loc-1-55 loc-1-56) (connected_down loc-1-56 loc-1-57) (connected_down loc-1-57 loc-1-58) (connected_down loc-1-58 loc-1-59) (connected_down loc-1-59 loc-1-60) (connected_down loc-1-60 loc-1-61)
        (connected_down loc-1-61 loc-1-62)
    )
    (:goal (and
        (at box1 loc-1-1)
    ))
    (:metric minimize (total-cost))
)