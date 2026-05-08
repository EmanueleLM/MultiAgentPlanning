(define (problem hanoi10_multiagent_instance7)
  (:domain hanoi_multiagent)
  (:objects
    agent_1 agent_2 orchestrator - agent
    left middle right - peg
    a b c d e f g h i j - disk
  )

  (:init
    ; initial immediate-support (on) relations for left stack top-to-bottom A B C D E F G H I J
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

    ; disk location by peg (all initially on left)
    (in a left)
    (in b left)
    (in c left)
    (in d left)
    (in e left)
    (in f left)
    (in g left)
    (in h left)
    (in i left)
    (in j left)

    ; clear: only top of left stack (a) is clear; other pegs empty and thus clear
    (clear a)
    (clear middle)
    (clear right)

    ; agents' movability constraints
    (can-move agent_1 a)
    (can-move agent_1 b)
    (can-move agent_1 c)
    (can-move agent_1 d)
    (can-move agent_1 e)

    (can-move agent_2 f)
    (can-move agent_2 g)
    (can-move agent_2 h)
    (can-move agent_2 i)
    (can-move agent_2 j)

    ; size ordering: a < b < c < d < e < f < g < h < i < j
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)
  )

  ; Goal: left peg top-to-bottom A B D E F G H I J, middle peg top-to-bottom C, right peg empty.
  (:goal (and
    ; immediate-support relations for left final stack: A on B, B on D, D on E... I on J, J on left
    (on a b)
    (on b d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ; middle final: C on middle
    (on c middle)

    ; disk-location by peg
    (in c middle)
    (in a left)
    (in b left)
    (in d left)
    (in e left)
    (in f left)
    (in g left)
    (in h left)
    (in i left)
    (in j left)

    ; ensure middle top disk is clear (C alone) and right is empty
    (clear c)
    (clear right)

    ; ensure no disk is on right
    (not (on a right))
    (not (on b right))
    (not (on c right))
    (not (on d right))
    (not (on e right))
    (not (on f right))
    (not (on g right))
    (not (on h right))
    (not (on i right))
    (not (on j right))
  ))