(define (problem hanoi10_multiagent)
  (:domain hanoi_multiagent)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    a b c d e f g h i j - disk
  )

  (:init
    ; initial immediate-support (on) relations for stack top-to-bottom: A B C D E F G H I J (A top, J bottom)
    ; Represented as A on B, B on C, ..., I on J, J on left (peg)
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

    ; every disk initially belongs to left peg's stack
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

    ; clear facts: only the topmost disk of the left stack (a) is clear; other pegs empty and thus clear
    (clear a)
    (clear middle)
    (clear right)

    ; agent move capabilities (as provided)
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
    ; list all ordered pairs where first is smaller than second
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

  ; Goal: left peg must have top-to-bottom A B D E F G H I J, middle peg top-to-bottom C, right peg empty.
  ; Immediate-support (on) relations encoding the final stacks:
  ; Left final stack top-to-bottom: A B D E F G H I J => A on B, B on D, D on E, E on F, F on G, G on H, H on I, I on J, J on left
  ; Middle final stack: C on middle
  (:goal (and
    ; desired immediate-support structure on left
    (on a b)
    (on b d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ; desired immediate-support on middle
    (on c middle)

    ; disk-location by peg: C must be on middle; all others must be on left
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

    ; ensure the middle top disk is clear (C alone on middle) and right is empty
    (clear c)
    (clear right)

    ; enforce right is empty: no disk may be directly on right
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
)