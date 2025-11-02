(define (problem Hanoi3Agents10DisksInstance3)
  (:domain hanoi-3agents-10disks)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    a b c d e f g h i j - disk
    ;; disk and peg names are also instances of place by typing in the domain
  )

  (:init
    ;; initial stacking: top-to-bottom on left: a b c d e f g h i j
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

    ;; clear facts: top disk a is clear; middle and right pegs are empty (clear)
    (clear a)
    (clear middle)
    (clear right)

    ;; move permissions
    (can-move agent_1 a)
    (can-move agent_1 b)
    (can-move agent_1 c)
    (can-move agent_1 d)

    (can-move agent_2 e)
    (can-move agent_2 f)
    (can-move agent_2 g)

    (can-move agent_3 h)
    (can-move agent_3 i)
    (can-move agent_3 j)

    ;; size ordering (smaller x y if x is smaller than y)
    ;; a smallest, j largest. Provide all pairwise relations where first is smaller.
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

  (:goal (and
    ;; left peg top-to-bottom: d e f g h i j  (d is top on e, ... j on left)
    (on d e)
    (clear d)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ;; middle peg top-to-bottom: a
    (on a middle)
    (clear a)

    ;; right peg top-to-bottom: b (top), c (below)
    (on b c)
    (clear b)
    (on c right)
  ))
)