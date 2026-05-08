(define (problem Hanoi3Agents10DisksInstance21)
  (:domain multi-agent-hanoi-3agents)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )

  (:init
    ;; All disks start on the left peg (top->bottom: a b c d e f g h i j)
    (on a left) (on b left) (on c left) (on d left) (on e left)
    (on f left) (on g left) (on h left) (on i left) (on j left)

    ;; only the top disk a is clear initially
    (clear a)

    ;; middle and right pegs are initially empty
    (empty middle) (empty right)

    ;; Size relations (a is smallest, j largest). Declare all pairwise smaller facts
    ;; for the total order a < b < c < d < e < f < g < h < i < j
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
    ;; Global goal as specified: disk C must end on the right peg,
    ;; middle peg must be empty, and the left peg must contain
    ;; disks A,B,D,E,F,G,H,I,J (the relative order of those on the left
    ;; is enforced by the fact that all disks are somewhere and C is on right).
    (on c right)
    (on a left) (on b left) (on d left) (on e left) (on f left)
    (on g left) (on h left) (on i left) (on j left)
    (empty middle)
    ;; require the smallest disk to be on top of left (top element)
    (clear a)
  ))
)