(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    ;; typed subgroups
    a b c d - disk_a
    e f g - disk_b
    h i j - disk_c
    agent1 agent2 agent3 - agent
  )

  (:init
    ;; Initial stack on left peg from top to bottom A..J represented as:
    ;; a on b, b on c, ..., i on j, j on left
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

    ;; Middle and right pegs are empty
    (clear middle)
    (clear right)

    ;; Top disk is clear
    (clear a)

    ;; Agent behavior constraints: agent2 and agent3 declared to perform no moves
    (no-move agent2)
    (no-move agent3)
    ;; agent1 is not flagged, so allowed to move its disks

    ;; Size ordering: smaller relations (A smaller than B..J, B smaller than C..J, etc.)
    ;; A is smallest
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    ;; B
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    ;; C
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    ;; D
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    ;; E
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    ;; F
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    ;; G
    (smaller g h) (smaller g i) (smaller g j)
    ;; H
    (smaller h i) (smaller h j)
    ;; I
    (smaller i j)
  )

  (:goal
    (and
      ;; Goal left peg top-to-bottom E,F,G,H,I,J => e on f, f on g, g on h, h on i, i on j, j on left
      (on e f) (on f g) (on g h) (on h i) (on i j) (on j left)

      ;; Goal middle peg top-to-bottom B,D => b on d, d on middle
      (on b d) (on d middle)

      ;; Goal right peg top-to-bottom A,C => a on c, c on right
      (on a c) (on c right)
    )
  )
)