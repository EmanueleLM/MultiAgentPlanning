(define (problem Hanoi3Agents10DisksInstance8)
  (:domain hanoi-3agents-10disks)
  (:objects
    agent_1 agent_2 agent_3 - agent
    peg-left peg-middle peg-right - peg
    a b c d e f g h i j - disk
  )
  (:init
    ; size ordering: a is smallest ... j is largest
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; agent capabilities (ownership constraints)
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

    ; initial stack: all disks on peg-left, smallest on top
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j peg-left)

    ; clear places
    (clear a)
    (clear peg-middle)
    (clear peg-right)

    (= (total-cost) 0)
  )
  (:goal
    (and
      ; goal stacks
      (on a b)
      (on b peg-middle)

      (on c peg-right)

      (on d e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j peg-left)
    )
  )
  (:metric minimize (total-cost))
)