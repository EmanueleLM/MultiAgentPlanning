(define (problem Hanoi2Agents10DisksInstance15)
  (:domain hanoi-coop-2agents-staged)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 - stage
  )
  (:init
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

    (atstage s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

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
      (on a c)
      (on c d)
      (on d right)
      (clear a)

      (on b e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j left)
      (clear b)

      (clear middle)
    )
  )
)