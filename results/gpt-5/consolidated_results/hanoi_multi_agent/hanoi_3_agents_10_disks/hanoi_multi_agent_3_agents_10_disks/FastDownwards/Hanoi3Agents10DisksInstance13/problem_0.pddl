(define (problem hanoi-agents-3peg-10disk-prob)
  (:domain hanoi-agents-3peg-10disk)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    a b c d e f g h i j - disk
    s01 s02 s03 s04 s05 s06 s07 s08 s09 s10 s11 s12 s13 s14 - step
  )
  (:init
    ; initial locations (top to bottom on left is a..j)
    (at a left)
    (at b left)
    (at c left)
    (at d left)
    (at e left)
    (at f left)
    (at g left)
    (at h left)
    (at i left)
    (at j left)

    ; static size ordering: a < b < c < d < e < f < g < h < i < j
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; permissions
    (permission agent_1 a)
    (permission agent_1 b)
    (permission agent_1 c)
    (permission agent_1 d)
    (permission agent_2 e)
    (permission agent_2 f)
    (permission agent_2 g)
    (permission agent_3 h)
    (permission agent_3 i)
    (permission agent_3 j)

    ; ordered move gating
    (current s01)
    (next s01 s02)
    (next s02 s03)
    (next s03 s04)
    (next s04 s05)
    (next s05 s06)
    (next s06 s07)
    (next s07 s08)
    (next s08 s09)
    (next s09 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)

    ; validated ordered move list
    ; 1: agent_1: move disk A from left to right
    (scheduled s01 agent_1 a left right)
    ; 2: agent_1: move disk B from left to middle
    (scheduled s02 agent_1 b left middle)
    ; 3: agent_1: move disk A from right to middle
    (scheduled s03 agent_1 a right middle)
    ; 4: agent_1: move disk C from left to right
    (scheduled s04 agent_1 c left right)
    ; 5: agent_1: move disk A from middle to left
    (scheduled s05 agent_1 a middle left)
    ; 6: agent_1: move disk B from middle to right
    (scheduled s06 agent_1 b middle right)
    ; 7: agent_1: move disk A from left to right
    (scheduled s07 agent_1 a left right)
    ; 8: agent_1: move disk D from left to middle
    (scheduled s08 agent_1 d left middle)
    ; 9: agent_1: move disk A from right to middle
    (scheduled s09 agent_1 a right middle)
    ; 10: agent_1: move disk B from right to left
    (scheduled s10 agent_1 b right left)
    ; 11: agent_1: move disk A from middle to left
    (scheduled s11 agent_1 a middle left)
    ; 12: agent_1: move disk C from right to middle
    (scheduled s12 agent_1 c right middle)
    ; 13: agent_1: move disk A from left to right
    (scheduled s13 agent_1 a left right)
  )
  (:goal
    (and
      ; enforce completion of the ordered sequence
      (current s14)

      ; goal configuration by peg membership (ordering is implied by rules)
      (at a right)
      (at b left)
      (at c middle)
      (at d middle)
      (at e left)
      (at f left)
      (at g left)
      (at h left)
      (at i left)
      (at j left)
    )
  )
)