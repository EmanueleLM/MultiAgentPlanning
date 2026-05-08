(define (problem sokoban_problem)
  (:domain sokoban_domain)
  (:objects
    player box - thing
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 l15 l16 l17 l18 l19 l20 l21 l22 l23 l24 l25 l26 l27 l28 l29 l30 l31 l32 l33 l34 l35 l36 l37 l38 l39 l40 l41 l42 l43 l44 l45 l46 l47 l48 l49 l50 l51 l52 l53 l54 l55 l56 l57 l58 l59 l60 l61 l62 l63 l64 l65 l66 l67 l68 l69 l70 l71 l72 l73 l74 l75 l76 l77 l78 l79 l80 l81 l82 l83 l84 l85 l86 l87 l88 l89 - location
  )
  (:init
    (at player l1)
    (at box l45)
    (clear l2) (clear l3) (clear l4) (clear l5) (clear l6) (clear l7) (clear l8) (clear l9) (clear l10)
    (clear l11) (clear l12) (clear l13) (clear l14) (clear l15) (clear l16) (clear l17) (clear l18) (clear l19) (clear l20)
    (clear l21) (clear l22) (clear l23) (clear l24) (clear l25) (clear l26) (clear l27) (clear l28) (clear l29) (clear l30)
    (clear l31) (clear l32) (clear l33) (clear l34) (clear l35) (clear l36) (clear l37) (clear l38) (clear l39) (clear l40)
    (clear l41) (clear l42) (clear l43) (clear l44)
    (clear l46) (clear l47) (clear l48) (clear l49) (clear l50)
    (clear l51) (clear l52) (clear l53) (clear l54) (clear l55) (clear l56) (clear l57) (clear l58) (clear l59) (clear l60)
    (clear l61) (clear l62) (clear l63) (clear l64) (clear l65) (clear l66) (clear l67) (clear l68) (clear l69) (clear l70)
    (clear l71) (clear l72) (clear l73) (clear l74) (clear l75) (clear l76) (clear l77) (clear l78) (clear l79) (clear l80)
    (clear l81) (clear l82) (clear l83) (clear l84) (clear l85) (clear l86) (clear l87) (clear l88) (clear l89)
    (adj l1 l2) (adj l2 l1) (adj l2 l3) (adj l3 l2) (adj l3 l4) (adj l4 l3) (adj l4 l5) (adj l5 l4) (adj l5 l6) (adj l6 l5) (adj l6 l7) (adj l7 l6) (adj l7 l8) (adj l8 l7) (adj l8 l9) (adj l9 l8) (adj l9 l10) (adj l10 l9) (adj l10 l11) (adj l11 l10) (adj l11 l12) (adj l12 l11) (adj l12 l13) (adj l13 l12) (adj l13 l14) (adj l14 l13) (adj l14 l15) (adj l15 l14) (adj l15 l16) (adj l16 l15) (adj l16 l17) (adj l17 l16) (adj l17 l18) (adj l18 l17) (adj l18 l19) (adj l19 l18) (adj l19 l20) (adj l20 l19) (adj l20 l21) (adj l21 l20) (adj l21 l22) (adj l22 l21) (adj l22 l23) (adj l23 l22) (adj l23 l24) (adj l24 l23) (adj l24 l25) (adj l25 l24) (adj l25 l26) (adj l26 l25) (adj l26 l27) (adj l27 l26) (adj l27 l28) (adj l28 l27) (adj l28 l29) (adj l29 l28) (adj l29 l30) (adj l30 l29) (adj l30 l31) (adj l31 l30) (adj l31 l32) (adj l32 l31) (adj l32 l33) (adj l33 l32) (adj l33 l34) (adj l34 l33) (adj l34 l35) (adj l35 l34) (adj l35 l36) (adj l36 l35) (adj l36 l37) (adj l37 l36) (adj l37 l38) (adj l38 l37) (adj l38 l39) (adj l39 l38) (adj l39 l40) (adj l40 l39) (adj l40 l41) (adj l41 l40) (adj l41 l42) (adj l42 l41) (adj l42 l43) (adj l43 l42) (adj l43 l44) (adj l44 l43) (adj l44 l45) (adj l45 l44) (adj l45 l46) (adj l46 l45) (adj l46 l47) (adj l47 l46) (adj l47 l48) (adj l48 l47) (adj l48 l49) (adj l49 l48) (adj l49 l50) (adj l50 l49) (adj l50 l51) (adj l51 l50) (adj l51 l52) (adj l52 l51) (adj l52 l53) (adj l53 l52) (adj l53 l54) (adj l54 l53) (adj l54 l55) (adj l55 l54) (adj l55 l56) (adj l56 l55) (adj l56 l57) (adj l57 l56) (adj l57 l58) (adj l58 l57) (adj l58 l59) (adj l59 l58) (adj l59 l60) (adj l60 l59) (adj l60 l61) (adj l61 l60) (adj l61 l62) (adj l62 l61) (adj l62 l63) (adj l63 l62) (adj l63 l64) (adj l64 l63) (adj l64 l65) (adj l65 l64) (adj l65 l66) (adj l66 l65) (adj l66 l67) (adj l67 l66) (adj l67 l68) (adj l68 l67) (adj l68 l69) (adj l69 l68) (adj l69 l70) (adj l70 l69) (adj l70 l71) (adj l71 l70) (adj l71 l72) (adj l72 l71) (adj l72 l73) (adj l73 l72) (adj l73 l74) (adj l74 l73) (adj l74 l75) (adj l75 l74) (adj l75 l76) (adj l76 l75) (adj l76 l77) (adj l77 l76) (adj l77 l78) (adj l78 l77) (adj l78 l79) (adj l79 l78) (adj l79 l80) (adj l80 l79) (adj l80 l81) (adj l81 l80) (adj l81 l82) (adj l82 l81) (adj l82 l83) (adj l83 l82) (adj l83 l84) (adj l84 l83) (adj l84 l85) (adj l85 l84) (adj l85 l86) (adj l86 l85) (adj l86 l87) (adj l87 l86) (adj l87 l88) (adj l88 l87) (adj l88 l89) (adj l89 l88)
  )
  (:goal (at box l89))
)