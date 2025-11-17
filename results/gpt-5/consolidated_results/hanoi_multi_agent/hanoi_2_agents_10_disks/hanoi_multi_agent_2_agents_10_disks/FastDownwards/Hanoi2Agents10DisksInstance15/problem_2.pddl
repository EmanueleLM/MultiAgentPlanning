(define (problem Hanoi2Agents10DisksInstance15)
  (:domain hanoi-coop-2agents-staged)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - stage
  )
  (:init
    ; agent capabilities
    (belongs_agent1 a)
    (belongs_agent1 b)
    (belongs_agent1 c)
    (belongs_agent1 d)
    (belongs_agent1 e)
    (belongs_agent2 f)
    (belongs_agent2 g)
    (belongs_agent2 h)
    (belongs_agent2 i)
    (belongs_agent2 j)

    ; size order (A < B < ... < J)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; placeable(d, s) iff s is a peg OR s is a larger disk than d
    ; onto pegs:
    (placeable a left) (placeable a middle) (placeable a right)
    (placeable b left) (placeable b middle) (placeable b right)
    (placeable c left) (placeable c middle) (placeable c right)
    (placeable d left) (placeable d middle) (placeable d right)
    (placeable e left) (placeable e middle) (placeable e right)
    (placeable f left) (placeable f middle) (placeable f right)
    (placeable g left) (placeable g middle) (placeable g right)
    (placeable h left) (placeable h middle) (placeable h right)
    (placeable i left) (placeable i middle) (placeable i right)
    (placeable j left) (placeable j middle) (placeable j right)
    ; onto larger disks:
    (placeable a b) (placeable a c) (placeable a d) (placeable a e) (placeable a f) (placeable a g) (placeable a h) (placeable a i) (placeable a j)
    (placeable b c) (placeable b d) (placeable b e) (placeable b f) (placeable b g) (placeable b h) (placeable b i) (placeable b j)
    (placeable c d) (placeable c e) (placeable c f) (placeable c g) (placeable c h) (placeable c i) (placeable c j)
    (placeable d e) (placeable d f) (placeable d g) (placeable d h) (placeable d i) (placeable d j)
    (placeable e f) (placeable e g) (placeable e h) (placeable e i) (placeable e j)
    (placeable f g) (placeable f h) (placeable f i) (placeable f j)
    (placeable g h) (placeable g i) (placeable g j)
    (placeable h i) (placeable h j)
    (placeable i j)

    ; initial full stack on left (top->bottom: a..j)
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

    ; clear statuses
    (clear a)
    (clear middle)
    (clear right)

    ; ordered stages (exactly 15 moves allowed)
    (current t0)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
  )

  (:goal
    (and
      ; right: A on C on D on right, with clear(A)
      (on a c)
      (on c d)
      (on d right)
      (clear a)

      ; left: B on E on F on G on H on I on J on left, with clear(B)
      (on b e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j left)
      (clear b)

      ; middle empty and clear
      (clear middle)
      (not (on a middle))
      (not (on b middle))
      (not (on c middle))
      (not (on d middle))
      (not (on e middle))
      (not (on f middle))
      (not (on g middle))
      (not (on h middle))
      (not (on i middle))
      (not (on j middle))

      ; terminal stage reached after exactly 15 moves
      (current t15)
    )
  )
)