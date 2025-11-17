(define (problem hanoi_multiagent_problem)
  (:domain hanoi_multiagent)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
    ;; Note: disks and pegs are used as supports where appropriate; typing kept explicit in objects declaration.
  )

  (:init
    ;; Initial stacking on the left: top A on B on C on left
    (on a b)
    (on b c)
    (on c left)

    ;; Initial stacking on the right: top D on E on F on G on H on I on J on right
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j right)

    ;; Clear/top-of-stack facts (true for supports that currently have nothing on top)
    (clear a)       ;; A has nothing above it (top of its small stack)
    (clear d)       ;; D has nothing above it (top of the right stack)
    (clear middle)  ;; middle peg is empty

    ;; Agent availability per the provided inputs:
    ;; agent_1 is available and will perform the listed move sequence (its actions are enabled)
    (can-act agent_1)
    ;; agent_2 and agent_3 perform no moves (their actions are disabled by absence of can-act facts)

    ;; Static size ordering: smaller relations (a < b < c < d < e < f < g < h < i < j)
    ;; a smaller than all that follow
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    ;; b smaller than those after it
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    ;; c smaller than those after it
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    ;; d smaller than those after it
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    ;; e smaller than those after it
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    ;; f smaller than those after it
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    ;; g smaller than those after it
    (smaller g h) (smaller g i) (smaller g j)
    ;; h smaller than those after it
    (smaller h i) (smaller h j)
    ;; i smaller than j
    (smaller i j)
  )

  ;; Global goal: only disk C must be on the middle peg (as described in public info).
  (:goal (and
    (on c middle)
  ))
)