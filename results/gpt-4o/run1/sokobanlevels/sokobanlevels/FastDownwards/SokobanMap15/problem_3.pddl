(define (problem sokoban-problem)
    (:domain sokoban)

    (:objects 
        player - agent
        box - item
        l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 l15 l16 l17 l18 l19 l20
        l21 l22 l23 l24 l25 l26 l27 l28 l29 l30 l31 l32 l33 l34 l35 l36 l37
        l38 l39 l40 l41 l42 l43 l44 l45 l46 l47 l48 l49 l50 l51 l52 l53 l54
        l55 l56 l57 l58 l59 l60 l61 l62 l63 l64 l65 l66 l67 l68 l69 l70 l71
        l72 l73 l74 l75 l76 l77 l78 l79 l80 l81 l82 l83 l84 l85 l86 l87 l88 
        l89 l90 l91 l92 l93 l94 l95 l96 l97 l98 l99 l100 l101 l102 - location
    )

    (:init 
        (at_agent player l2)
        (at_item box l3)
        (is_goal l4)

        ; Free locations
        (is_free l1) (is_free l2) (is_free l3)
        (is_free l5) (is_free l6) (is_free l7) 
        (is_free l8) (is_free l9) (is_free l10)
        (is_free l11) (is_free l12) (is_free l13) 
        (is_free l14) (is_free l15) (is_free l16)
        (is_free l17) (is_free l18) (is_free l19) 
        (is_free l20) (is_free l21) (is_free l22)
        (is_free l23) (is_free l24) (is_free l25) 
        (is_free l26) (is_free l27) (is_free l28)
        (is_free l29) (is_free l30) (is_free l31) 
        (is_free l32) (is_free l33) (is_free l34)
        (is_free l35) (is_free l36) (is_free l37) 
        (is_free l38) (is_free l39) (is_free l40)
        (is_free l41) (is_free l42) (is_free l43) 
        (is_free l44) (is_free l45) (is_free l46)
        (is_free l47) (is_free l48) (is_free l49) 
        (is_free l50) (is_free l51) (is_free l52)
        (is_free l53) (is_free l54) (is_free l55) 
        (is_free l56) (is_free l57) (is_free l58)
        (is_free l59) (is_free l60) (is_free l61) 
        (is_free l62) (is_free l63) (is_free l64)
        (is_free l65) (is_free l66) (is_free l67) 
        (is_free l68) (is_free l69) (is_free l70)
        (is_free l71) (is_free l72) (is_free l73) 
        (is_free l74) (is_free l75) (is_free l76)
        (is_free l77) (is_free l78) (is_free l79) 
        (is_free l80) (is_free l81) (is_free l82)
        (is_free l83) (is_free l84) (is_free l85) 
        (is_free l86) (is_free l87) (is_free l88)
        (is_free l89) (is_free l90) (is_free l91) 
        (is_free l92) (is_free l93) (is_free l94)
        (is_free l95) (is_free l96) (is_free l97) 
        (is_free l98) (is_free l99) (is_free l100)
        (is_free l101) (is_free l102)

        ; Adjacency relationships (assuming a linear horizontal layout for simplicity)
        (adjacent l1 l2) 
        (adjacent l2 l3) 
        (adjacent l3 l4) 
    )

    (:goal 
        (at_item box l4)
    )
)