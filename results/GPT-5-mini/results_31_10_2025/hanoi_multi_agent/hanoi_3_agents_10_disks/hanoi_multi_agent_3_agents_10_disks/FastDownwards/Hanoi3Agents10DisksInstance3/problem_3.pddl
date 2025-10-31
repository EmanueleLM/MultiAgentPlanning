(define (problem Hanoi3Agents10DisksInstance3)
  (:domain hanoi-3agents-10disks)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
  )

  (:init
    ;; initial stacking: top-to-bottom on left: a b c d e f g h i j
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    ;; clear facts
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ;; move permissions (agents declared as domain constants)
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
    ;; left peg top-to-bottom: d e f g h i j  (d on e, ... j on left)
    (on-disk d e)
    (clear-disk d)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    ;; middle peg top-to-bottom: a
    (on-peg a middle)
    (clear-disk a)

    ;; right peg top-to-bottom: b (top), c (below)
    (on-disk b c)
    (clear-disk b)
    (on-peg c right)
  ))
)