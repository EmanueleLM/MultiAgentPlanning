(define (problem Hanoi2Agents10DisksInstance3)
  (:domain hanoi2agents)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    agent_1 agent_2 orchestrator consistency_auditor - agent
  )
  (:init
    ; size ordering (strict)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; initial stack: left has A..J (A top), middle and right empty
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

    ; agent-disk permissions
    (permitted agent_1 a)
    (permitted agent_1 b)
    (permitted agent_1 c)
    (permitted agent_1 d)
    (permitted agent_1 e)

    (permitted agent_2 f)
    (permitted agent_2 g)
    (permitted agent_2 h)
    (permitted agent_2 i)
    (permitted agent_2 j)
  )
  (:goal (and
    ; goal stacks:
    ; left: A on B on E on F on G on H on I on J on left
    (on a b)
    (on b e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ; right: C on D on right
    (on c d)
    (on d right)

    ; middle empty and top disks clear
    (clear a)
    (clear c)
    (clear middle)
  ))
)