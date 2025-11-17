; To run with FastDownward:
; fast-downward.py domain.pddl problem.pddl --search 'astar(lmcut)'

(define (problem hanoi-2agents-10-Instance7-ordered)
  (:domain hanoi-3peg-2agents-ordered)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    a b c d e f g h i j - disk
    s1 s2 s3 s4 s5 s6 s7 s8 - step
  )

  (:init
    ; permissions
    (allowed agent_1 a)
    (allowed agent_1 b)
    (allowed agent_1 c)
    (allowed agent_1 d)
    (allowed agent_1 e)
    (allowed agent_2 f)
    (allowed agent_2 g)
    (allowed agent_2 h)
    (allowed agent_2 i)
    (allowed agent_2 j)

    ; full smaller relation (A < B < ... < J)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; initial configuration: left has A(top) .. J(bottom); middle and right empty
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

    ; scheduling to enforce the approved ordered moves
    (at-step s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)

    ; 1) agent_1: move A from left (off B) to middle (peg)
    (scheduled-peg s1 agent_1 a b middle)

    ; 2) agent_1: move B from left (off C) to right (peg)
    (scheduled-peg s2 agent_1 b c right)

    ; 3) agent_1: move A from middle (peg) to right (onto B)
    (scheduled-disk s3 agent_1 a middle b)

    ; 4) agent_1: move C from left (off D) to middle (peg)
    (scheduled-peg s4 agent_1 c d middle)

    ; 5) agent_1: move A from right (off B) to middle (onto C)
    (scheduled-disk s5 agent_1 a b c)

    ; 6) agent_1: move B from right (peg) to left (onto D)
    (scheduled-disk s6 agent_1 b right d)

    ; 7) agent_1: move A from middle (off C) to left (onto B)
    (scheduled-disk s7 agent_1 a c b)
  )

  (:goal
    (and
      ; Goal configuration:
      ; left: A on B on D on E on F on G on H on I on J
      (on a b)
      (on b d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j left)

      ; middle: C alone on peg
      (on c middle)

      ; right: empty
      (clear right)

      ; explicit tops
      (clear a)
      (clear c)
    )
  )
)