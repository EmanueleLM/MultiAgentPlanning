(define (problem Hanoi3Agents10DisksInstance1)
  (:domain hanoi-3pegs-10disks)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
  )
  (:init
    ; Size ordering: a (smallest) ... j (largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; Initial stack: left has top->bottom a b c d e f g h i j
    (on a left)
    (on b a)
    (on c b)
    (on d c)
    (on e d)
    (on f e)
    (on g f)
    (on h g)
    (on i h)
    (on j i)

    (clear j)
    (clear middle)
    (clear right)
  )

  (:goal (and
    ; Left: top->bottom c d f g h i j
    (on c left)
    (on d c)
    (on f d)
    (on g f)
    (on h g)
    (on i h)
    (on j i)

    ; Middle: top->bottom a b e
    (on a middle)
    (on b a)
    (on e b)

    ; Right is empty
    (clear right)

    ; Top disk on left is j (clear)
    (clear j)
  ))

  ; Plan hint (agents respected in the human-executed sequence):
  ; agent_1: move disk A from left to middle
  ; agent_1: move disk B from left to right
  ; agent_1: move disk A from middle to right
  ; agent_1: move disk C from left to middle
  ; agent_1: move disk A from right to left
  ; agent_1: move disk B from right to middle
  ; agent_1: move disk A from left to middle
  ; agent_1: move disk D from left to right
  ; agent_1: move disk A from middle to right
  ; agent_1: move disk B from middle to left
  ; agent_1: move disk A from right to left
  ; agent_1: move disk C from middle to right
  ; agent_1: move disk A from left to middle
  ; agent_1: move disk B from left to right
  ; agent_1: move disk A from middle to right
  ; agent_2: move disk E from left to middle
  ; agent_1: move disk A from right to middle
  ; agent_1: move disk B from right to left
  ; agent_1: move disk A from middle to left
  ; agent_1: move disk C from right to middle
  ; agent_1: move disk A from left to right
  ; agent_1: move disk B from left to middle
  ; agent_1: move disk A from right to middle
  ; agent_1: move disk D from right to left
  ; agent_1: move disk A from middle to left
  ; agent_1: move disk B from middle to right
  ; agent_1: move disk A from left to right
  ; agent_1: move disk C from middle to left
  ; agent_1: move disk A from right to left
  ; agent_1: move disk B from right to middle
  ; agent_1: move disk A from left to middle
)