(define (problem sokoban_map15_prob)
  (:domain sokoban_map15)
  (:objects
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10
    l11 l12 l13 l14 l15 l16 l17 l18 l19 l20
    l21 l22 l23 l24 l25 l26 l27 l28 l29 l30
    l31 l32 l33 l34 l35 l36 l37 l38 l39 l40
    l41 l42 l43 l44 l45 l46 l47 l48 l49 l50
    l51 l52 l53 l54 l55 l56 l57 l58 l59 l60
    l61 l62 l63 l64 l65 l66 l67 l68 l69 l70
    l71 l72 l73 l74 l75 l76 l77 l78 l79 l80
    l81 l82 l83 l84 l85 l86 l87 l88 l89 l90
    l91 l92 l93 l94 l95 l96 l97 - loc
  )
  (:init
    (at_p l1)
    (at_b l50)
    (clear l2) (clear l3) (clear l4) (clear l5) (clear l6) (clear l7) (clear l8) (clear l9) (clear l10)
    (clear l11) (clear l12) (clear l13) (clear l14) (clear l15) (clear l16) (clear l17) (clear l18) (clear l19) (clear l20)
    (clear l21) (clear l22) (clear l23) (clear l24) (clear l25) (clear l26) (clear l27) (clear l28) (clear l29) (clear l30)
    (clear l31) (clear l32) (clear l33) (clear l34) (clear l35) (clear l36) (clear l37) (clear l38) (clear l39) (clear l40)
    (clear l41) (clear l42) (clear l43) (clear l44) (clear l45) (clear l46) (clear l47) (clear l48) (clear l49)
    (clear l51) (clear l52) (clear l53) (clear l54) (clear l55) (clear l56) (clear l57) (clear l58) (clear l59) (clear l60)
    (clear l61) (clear l62) (clear l63) (clear l64) (clear l65) (clear l66) (clear l67) (clear l68) (clear l69) (clear l70)
    (clear l71) (clear l72) (clear l73) (clear l74) (clear l75) (clear l76) (clear l77) (clear l78) (clear l79) (clear l80)
    (clear l81) (clear l82) (clear l83) (clear l84) (clear l85) (clear l86) (clear l87) (clear l88) (clear l89) (clear l90)
    (clear l91) (clear l92) (clear l93) (clear l94) (clear l95) (clear l96) (clear l97)
    (adj_d l1 l2) (adj_d l2 l3) (adj_d l3 l4) (adj_d l4 l5) (adj_d l5 l6) (adj_d l6 l7) (adj_d l7 l8) (adj_d l8 l9) (adj_d l9 l10)
    (adj_d l10 l11) (adj_d l11 l12) (adj_d l12 l13) (adj_d l13 l14) (adj_d l14 l15) (adj_d l15 l16) (adj_d l16 l17) (adj_d l17 l18) (adj_d l18 l19) (adj_d l19 l20)
    (adj_d l20 l21) (adj_d l21 l22) (adj_d l22 l23) (adj_d l23 l24) (adj_d l24 l25) (adj_d l25 l26) (adj_d l26 l27) (adj_d l27 l28) (adj_d l28 l29) (adj_d l29 l30)
    (adj_d l30 l31) (adj_d l31 l32) (adj_d l32 l33) (adj_d l33 l34) (adj_d l34 l35) (adj_d l35 l36) (adj_d l36 l37) (adj_d l37 l38) (adj_d l38 l39) (adj_d l39 l40)
    (adj_d l40 l41) (adj_d l41 l42) (adj_d l42 l43) (adj_d l43 l44) (adj_d l44 l45) (adj_d l45 l46) (adj_d l46 l47) (adj_d l47 l48) (adj_d l48 l49) (adj_d l49 l50)
    (adj_d l50 l51) (adj_d l51 l52) (adj_d l52 l53) (adj_d l53 l54) (adj_d l54 l55) (adj_d l55 l56) (adj_d l56 l57) (adj_d l57 l58) (adj_d l58 l59) (adj_d l59 l60)
    (adj_d l60 l61) (adj_d l61 l62) (adj_d l62 l63) (adj_d l63 l64) (adj_d l64 l65) (adj_d l65 l66) (adj_d l66 l67) (adj_d l67 l68) (adj_d l68 l69) (adj_d l69 l70)
    (adj_d l70 l71) (adj_d l71 l72) (adj_d l72 l73) (adj_d l73 l74) (adj_d l74 l75) (adj_d l75 l76) (adj_d l76 l77) (adj_d l77 l78) (adj_d l78 l79) (adj_d l79 l80)
    (adj_d l80 l81) (adj_d l81 l82) (adj_d l82 l83) (adj_d l83 l84) (adj_d l84 l85) (adj_d l85 l86) (adj_d l86 l87) (adj_d l87 l88) (adj_d l88 l89) (adj_d l89 l90)
    (adj_d l90 l91) (adj_d l91 l92) (adj_d l92 l93) (adj_d l93 l94) (adj_d l94 l95) (adj_d l95 l96) (adj_d l96 l97)
    (adj_u l2 l1) (adj_u l3 l2) (adj_u l4 l3) (adj_u l5 l4) (adj_u l6 l5) (adj_u l7 l6) (adj_u l8 l7) (adj_u l9 l8) (adj_u l10 l9)
    (adj_u l11 l10) (adj_u l12 l11) (adj_u l13 l12) (adj_u l14 l13) (adj_u l15 l14) (adj_u l16 l15) (adj_u l17 l16) (adj_u l18 l17) (adj_u l19 l18) (adj_u l20 l19)
    (adj_u l21 l20) (adj_u l22 l21) (adj_u l23 l22) (adj_u l24 l23) (adj_u l25 l24) (adj_u l26 l25) (adj_u l27 l26) (adj_u l28 l27) (adj_u l29 l28) (adj_u l30 l29)
    (adj_u l31 l30) (adj_u l32 l31) (adj_u l33 l32) (adj_u l34 l33) (adj_u l35 l34) (adj_u l36 l35) (adj_u l37 l36) (adj_u l38 l37) (adj_u l39 l38) (adj_u l40 l39)
    (adj_u l41 l40) (adj_u l42 l41) (adj_u l43 l42) (adj_u l44 l43) (adj_u l45 l44) (adj_u l46 l45) (adj_u l47 l46) (adj_u l48 l47) (adj_u l49 l48) (adj_u l50 l49)
    (adj_u l51 l50) (adj_u l52 l51) (adj_u l53 l52) (adj_u l54 l53) (adj_u l55 l54) (adj_u l56 l55) (adj_u l57 l56) (adj_u l58 l57) (adj_u l59 l58) (adj_u l60 l59)
    (adj_u l61 l60) (adj_u l62 l61) (adj_u l63 l62) (adj_u l64 l63) (adj_u l65 l64) (adj_u l66 l65) (adj_u l67 l66) (adj_u l68 l67) (adj_u l69 l68) (adj_u l70 l69)
    (adj_u l71 l70) (adj_u l72 l71) (adj_u l73 l72) (adj_u l74 l73) (adj_u l75 l74) (adj_u l76 l75) (adj_u l77 l76) (adj_u l78 l77) (adj_u l79 l78) (adj_u l80 l79)
    (adj_u l81 l80) (adj_u l82 l81) (adj_u l83 l82) (adj_u l84 l83) (adj_u l85 l84) (adj_u l86 l85) (adj_u l87 l86) (adj_u l88 l87) (adj_u l89 l88) (adj_u l90 l89)
    (adj_u l91 l90) (adj_u l92 l91) (adj_u l93 l92) (adj_u l94 l93) (adj_u l95 l94) (adj_u l96 l95) (adj_u l97 l96)
  )
  (:goal
    (at_b l97)
  )
)