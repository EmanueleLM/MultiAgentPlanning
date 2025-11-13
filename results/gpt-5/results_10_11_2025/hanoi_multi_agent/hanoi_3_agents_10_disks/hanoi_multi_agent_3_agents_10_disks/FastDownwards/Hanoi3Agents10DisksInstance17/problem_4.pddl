(define (problem Hanoi3Agents10DisksInstance17)
  (:domain hanoi-3agents-staged)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    agent_1 agent_2 agent_3 - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 - stage
  )
  (:init
    ; size ordering (a smallest ... j largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; agent permissions
    (canmove agent_1 a) (canmove agent_1 b) (canmove agent_1 c) (canmove agent_1 d)
    (canmove agent_2 e) (canmove agent_2 f) (canmove agent_2 g)
    (canmove agent_3 h) (canmove agent_3 i) (canmove agent_3 j)

    ; initial stack: left has a (top) ... j (bottom), others empty
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    (clear a)
    (clear middle)
    (clear right)

    ; stage progression
    (atstage s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17)
  )

  (:goal (and
    ; right: a
    (on a right)
    (clear a)

    ; middle: c on d
    (on c d)
    (on d middle)
    (clear c)

    ; left: b on e on f on g on h on i on j on left
    (on b e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)
    (clear b)

    ; exact stage completion
    (atstage s17)
  ))
)