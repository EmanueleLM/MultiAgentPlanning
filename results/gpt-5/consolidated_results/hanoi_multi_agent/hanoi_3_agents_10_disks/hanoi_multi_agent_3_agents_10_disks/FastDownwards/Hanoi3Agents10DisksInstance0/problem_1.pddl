(define (problem hanoi3agents10disks-instance0)
  (:domain hanoi-multiagent-3agents-10disks)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    a b c d e f g h i j - disk
  )
  (:init
    ; agent permissions
    (controls agent_1 a)
    (controls agent_1 b)
    (controls agent_1 c)
    (controls agent_1 d)
    (controls agent_2 e)
    (controls agent_2 f)
    (controls agent_2 g)
    (controls agent_3 h)
    (controls agent_3 i)
    (controls agent_3 j)

    ; total order: a (smallest) ... j (largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; legal placement pairs (static)
    ; any disk can go on any peg
    (ok-support a left) (ok-support a middle) (ok-support a right)
    (ok-support b left) (ok-support b middle) (ok-support b right)
    (ok-support c left) (ok-support c middle) (ok-support c right)
    (ok-support d left) (ok-support d middle) (ok-support d right)
    (ok-support e left) (ok-support e middle) (ok-support e right)
    (ok-support f left) (ok-support f middle) (ok-support f right)
    (ok-support g left) (ok-support g middle) (ok-support g right)
    (ok-support h left) (ok-support h middle) (ok-support h right)
    (ok-support i left) (ok-support i middle) (ok-support i right)
    (ok-support j left) (ok-support j middle) (ok-support j right)
    ; disks onto larger disks
    (ok-support a b) (ok-support a c) (ok-support a d) (ok-support a e) (ok-support a f) (ok-support a g) (ok-support a h) (ok-support a i) (ok-support a j)
    (ok-support b c) (ok-support b d) (ok-support b e) (ok-support b f) (ok-support b g) (ok-support b h) (ok-support b i) (ok-support b j)
    (ok-support c d) (ok-support c e) (ok-support c f) (ok-support c g) (ok-support c h) (ok-support c i) (ok-support c j)
    (ok-support d e) (ok-support d f) (ok-support d g) (ok-support d h) (ok-support d i) (ok-support d j)
    (ok-support e f) (ok-support e g) (ok-support e h) (ok-support e i) (ok-support e j)
    (ok-support f g) (ok-support f h) (ok-support f i) (ok-support f j)
    (ok-support g h) (ok-support g i) (ok-support g j)
    (ok-support h i) (ok-support h j)
    (ok-support i j)

    ; initial configuration: left has a(top) ... j(bottom); middle, right empty
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
  )
  (:goal
    (and
      ; right peg: top->bottom a, c
      (on a c)
      (on c right)
      ; left peg: top->bottom b, d, e, f, g, h, i, j
      (on b d)
      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j left)
      ; middle peg empty, and tops fixed
      (clear a)
      (clear b)
      (clear middle)
    )
  )
)