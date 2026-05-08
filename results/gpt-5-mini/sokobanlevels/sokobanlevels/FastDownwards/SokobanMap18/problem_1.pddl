(define (problem sokoban_instance_corridor)
  (:domain sokoban_corridor)
  (:objects
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20
    p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40
    p41 p42 p43 p44 p45 p46 p47 p48 p49 p50 p51 p52 p53 p54 p55 p56 p57 p58 p59 p60
    p61 p62 p63 p64 p65 p66 p67 p68 p69 p70 p71 p72 p73 p74 p75 p76 p77 p78 p79 p80
    p81 p82 p83 p84 p85 p86 p87 p88 p89 p90 p91 p92 p93 p94 p95 p96 p97 p98 p99 p100
    p101 p102 p103 p104 p105 p106 p107 p108 p109 p110 p111 p112 p113 p114 p115 p116 p117 p118 p119 p120
    p121 p122 p123 p124 p125 p126 p127 p128 p129 p130 p131 p132 p133 p134 p135 p136 p137 p138 p139 p140
    p141 p142 p143 p144 p145 p146 p147 p148 p149 p150 p151 p152 p153 p154 p155 p156 p157 p158 p159 p160
    p161 p162 p163 p164 p165 p166 p167 p168 p169 p170 p171 p172 p173 p174 p175 p176 p177 p178 p179 p180
    p181 p182 p183 p184 p185 p186 p187 p188 p189 p190 p191 p192 p193 p194 p195 p196 p197 p198 p199 p200
    p201 p202 p203 p204 p205 p206 p207 p208 p209 p210 p211 p212 p213 p214 p215 p216 p217 p218 p219 p220
    p221 p222 p223 p224 p225 p226 p227 p228 p229 p230 p231 p232 p233 p234 p235 p236 p237 p238 p239 p240
    p241 p242 p243 p244 p245 p246 p247 p248 p249 - position
    box1 - box
    player1 - player
  )
  (:init
    (goal p1)
    (at-box box1 p151)
    (at-player player1 p249)
    (north p1 p2) (north p2 p3) (north p3 p4) (north p4 p5) (north p5 p6)
    (north p6 p7) (north p7 p8) (north p8 p9) (north p9 p10) (north p10 p11)
    (north p11 p12) (north p12 p13) (north p13 p14) (north p14 p15) (north p15 p16)
    (north p16 p17) (north p17 p18) (north p18 p19) (north p19 p20) (north p20 p21)
    (north p21 p22) (north p22 p23) (north p23 p24) (north p24 p25) (north p25 p26)
    (north p26 p27) (north p27 p28) (north p28 p29) (north p29 p30) (north p30 p31)
    (north p31 p32) (north p32 p33) (north p33 p34) (north p34 p35) (north p35 p36)
    (north p36 p37) (north p37 p38) (north p38 p39) (north p39 p40) (north p40 p41)
    (north p41 p42) (north p42 p43) (north p43 p44) (north p44 p45) (north p45 p46)
    (north p46 p47) (north p47 p48) (north p48 p49) (north p49 p50) (north p50 p51)
    (north p51 p52) (north p52 p53) (north p53 p54) (north p54 p55) (north p55 p56)
    (north p56 p57) (north p57 p58) (north p58 p59) (north p59 p60) (north p60 p61)
    (north p61 p62) (north p62 p63) (north p63 p64) (north p64 p65) (north p65 p66)
    (north p66 p67) (north p67 p68) (north p68 p69) (north p69 p70) (north p70 p71)
    (north p71 p72) (north p72 p73) (north p73 p74) (north p74 p75) (north p75 p76)
    (north p76 p77) (north p77 p78) (north p78 p79) (north p79 p80) (north p80 p81)
    (north p81 p82) (north p82 p83) (north p83 p84) (north p84 p85) (north p85 p86)
    (north p86 p87) (north p87 p88) (north p88 p89) (north p89 p90) (north p90 p91)
    (north p91 p92) (north p92 p93) (north p93 p94) (north p94 p95) (north p95 p96)
    (north p96 p97) (north p97 p98) (north p98 p99) (north p99 p100) (north p100 p101)
    (north p101 p102) (north p102 p103) (north p103 p104) (north p104 p105) (north p105 p106)
    (north p106 p107) (north p107 p108) (north p108 p109) (north p109 p110) (north p110 p111)
    (north p111 p112) (north p112 p113) (north p113 p114) (north p114 p115) (north p115 p116)
    (north p116 p117) (north p117 p118) (north p118 p119) (north p119 p120) (north p120 p121)
    (north p121 p122) (north p122 p123) (north p123 p124) (north p124 p125) (north p125 p126)
    (north p126 p127) (north p127 p128) (north p128 p129) (north p129 p130) (north p130 p131)
    (north p131 p132) (north p132 p133) (north p133 p134) (north p134 p135) (north p135 p136)
    (north p136 p137) (north p137 p138) (north p138 p139) (north p139 p140) (north p140 p141)
    (north p141 p142) (north p142 p143) (north p143 p144) (north p144 p145) (north p145 p146)
    (north p146 p147) (north p147 p148) (north p148 p149) (north p149 p150) (north p150 p151)
    (north p151 p152) (north p152 p153) (north p153 p154) (north p154 p155) (north p155 p156)
    (north p156 p157) (north p157 p158) (north p158 p159) (north p159 p160) (north p160 p161)
    (north p161 p162) (north p162 p163) (north p163 p164) (north p164 p165) (north p165 p166)
    (north p166 p167) (north p167 p168) (north p168 p169) (north p169 p170) (north p170 p171)
    (north p171 p172) (north p172 p173) (north p173 p174) (north p174 p175) (north p175 p176)
    (north p176 p177) (north p177 p178) (north p178 p179) (north p179 p180) (north p180 p181)
    (north p181 p182) (north p182 p183) (north p183 p184) (north p184 p185) (north p185 p186)
    (north p186 p187) (north p187 p188) (north p188 p189) (north p189 p190) (north p190 p191)
    (north p191 p192) (north p192 p193) (north p193 p194) (north p194 p195) (north p195 p196)
    (north p196 p197) (north p197 p198) (north p198 p199) (north p199 p200) (north p200 p201)
    (north p201 p202) (north p202 p203) (north p203 p204) (north p204 p205) (north p205 p206)
    (north p206 p207) (north p207 p208) (north p208 p209) (north p209 p210) (north p210 p211)
    (north p211 p212) (north p212 p213) (north p213 p214) (north p214 p215) (north p215 p216)
    (north p216 p217) (north p217 p218) (north p218 p219) (north p219 p220) (north p220 p221)
    (north p221 p222) (north p222 p223) (north p223 p224) (north p224 p225) (north p225 p226)
    (north p226 p227) (north p227 p228) (north p228 p229) (north p229 p230) (north p230 p231)
    (north p231 p232) (north p232 p233) (north p233 p234) (north p234 p235) (north p235 p236)
    (north p236 p237) (north p237 p238) (north p238 p239) (north p239 p240) (north p240 p241)
    (north p241 p242) (north p242 p243) (north p243 p244) (north p244 p245) (north p245 p246)
    (north p246 p247) (north p247 p248) (north p248 p249)
  )
  (:goal (and (at-box box1 p1)))
)