(define (problem sokoban_instance_problem)
  (:domain sokoban_instance)
  (:objects
    c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20
    c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40
    c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60
    c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 c76 c77 c78 c79 c80
    c81 c82 c83 c84 c85 c86 c87 c88 c89 c90 c91 c92 c93 c94 c95 c96 c97 c98 c99 c100
    c101 c102 c103 c104 c105 c106 c107 c108 c109 c110 c111 c112 c113 c114 c115 c116 c117 c118 c119 c120
    c121 c122 c123 c124 c125 c126 c127 c128 c129 c130 c131 c132 c133 c134 c135 c136 c137 c138 c139 c140
    c141 c142 c143 c144 c145 c146 c147 c148 c149 c150 c151 c152 c153 c154 c155 c156 c157 c158 c159 c160
    c161 c162 c163 c164 c165 c166 c167 - cell
    player1 - agent
    box1 - crate
  )
  (:init
    ;; one-direction successor chain c1 -> c2 -> ... -> c167
    (next c1 c2) (next c2 c3) (next c3 c4) (next c4 c5) (next c5 c6) (next c6 c7) (next c7 c8) (next c8 c9) (next c9 c10) (next c10 c11)
    (next c11 c12) (next c12 c13) (next c13 c14) (next c14 c15) (next c15 c16) (next c16 c17) (next c17 c18) (next c18 c19) (next c19 c20) (next c20 c21)
    (next c21 c22) (next c22 c23) (next c23 c24) (next c24 c25) (next c25 c26) (next c26 c27) (next c27 c28) (next c28 c29) (next c29 c30) (next c30 c31)
    (next c31 c32) (next c32 c33) (next c33 c34) (next c34 c35) (next c35 c36) (next c36 c37) (next c37 c38) (next c38 c39) (next c39 c40) (next c40 c41)
    (next c41 c42) (next c42 c43) (next c43 c44) (next c44 c45) (next c45 c46) (next c46 c47) (next c47 c48) (next c48 c49) (next c49 c50) (next c50 c51)
    (next c51 c52) (next c52 c53) (next c53 c54) (next c54 c55) (next c55 c56) (next c56 c57) (next c57 c58) (next c58 c59) (next c59 c60) (next c60 c61)
    (next c61 c62) (next c62 c63) (next c63 c64) (next c64 c65) (next c65 c66) (next c66 c67) (next c67 c68) (next c68 c69) (next c69 c70) (next c70 c71)
    (next c71 c72) (next c72 c73) (next c73 c74) (next c74 c75) (next c75 c76) (next c76 c77) (next c77 c78) (next c78 c79) (next c79 c80) (next c80 c81)
    (next c81 c82) (next c82 c83) (next c83 c84) (next c84 c85) (next c85 c86) (next c86 c87) (next c87 c88) (next c88 c89) (next c89 c90) (next c90 c91)
    (next c91 c92) (next c92 c93) (next c93 c94) (next c94 c95) (next c95 c96) (next c96 c97) (next c97 c98) (next c98 c99) (next c99 c100) (next c100 c101)
    (next c101 c102) (next c102 c103) (next c103 c104) (next c104 c105) (next c105 c106) (next c106 c107) (next c107 c108) (next c108 c109) (next c109 c110) (next c110 c111)
    (next c111 c112) (next c112 c113) (next c113 c114) (next c114 c115) (next c115 c116) (next c116 c117) (next c117 c118) (next c118 c119) (next c119 c120) (next c120 c121)
    (next c121 c122) (next c122 c123) (next c123 c124) (next c124 c125) (next c125 c126) (next c126 c127) (next c127 c128) (next c128 c129) (next c129 c130) (next c130 c131)
    (next c131 c132) (next c132 c133) (next c133 c134) (next c134 c135) (next c135 c136) (next c136 c137) (next c137 c138) (next c138 c139) (next c139 c140) (next c140 c141)
    (next c141 c142) (next c142 c143) (next c143 c144) (next c144 c145) (next c145 c146) (next c146 c147) (next c147 c148) (next c148 c149) (next c149 c150) (next c150 c151)
    (next c151 c152) (next c152 c153) (next c153 c154) (next c154 c155) (next c155 c156) (next c156 c157) (next c157 c158) (next c158 c159) (next c159 c160) (next c160 c161)
    (next c161 c162) (next c162 c163) (next c163 c164) (next c164 c165) (next c165 c166) (next c166 c167)

    ;; initial placements (only necessary occupancy fact included)
    (player-at c167)
    (box-at box1 c99)
    (occupied c99)
    (goal c1)
  )
  (:goal (and (box-at box1 c1)))
)