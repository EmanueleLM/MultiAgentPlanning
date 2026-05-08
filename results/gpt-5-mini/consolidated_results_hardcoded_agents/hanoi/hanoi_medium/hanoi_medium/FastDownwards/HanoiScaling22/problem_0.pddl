(define (problem multi-agent-tower-problem)
  (:domain multi-agent-tower)
  (:objects
    a b c d e - disk
    left middle right - peg
    agent1 agent2 - agent
  )

  (:init
    ; initial stacking on peg left: e bottom, d on e, c on d, b on c, a on b
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    ; clear: only top-most disk a is clear; pegs middle and right are clear initially
    (clear a)
    (clear middle)
    (clear right)
    ; disks b,c,d,e are not clear implicitly (no facts), but we'll not state them as true

    ; both agents start with empty hands
    (handempty agent1)
    (handempty agent2)

    ; size ordering (strict): a < b < c < d < e
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    ; final full stack moved to peg right with same internal ordering (e bottom)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e right)

    ; final terminal conditions: both agents have empty hands
    (handempty agent1)
    (handempty agent2)

    ; pegs left and middle must be empty (explicit terminal condition)
    (clear left)
    (clear middle)
    ; top-most disk (a) remains clear as necessary for well-formed stack
    (clear a)
  ))
)