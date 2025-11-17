(define (problem Hanoi2Agents15DisksInstance24)
  (:domain hanoi_two_agents_15)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
  )
  (:init
    (on a left) (on b left) (on c left) (on d left) (on e left) (on f left) (on g left)
    (on h left) (on i left) (on j left) (on k left) (on l left) (on m left) (on n left) (on o left)

    (top left a)
    (empty middle)
    (empty right)

    (direct_below b a) (direct_below c b) (direct_below d c) (direct_below e d) (direct_below f e)
    (direct_below g f) (direct_below h g) (direct_below i h) (direct_below j i) (direct_below k j)
    (direct_below l k) (direct_below m l) (direct_below n m) (direct_below o n)

    (can_move_agent1 a) (can_move_agent1 b) (can_move_agent1 c) (can_move_agent1 d)
    (can_move_agent1 e) (can_move_agent1 f) (can_move_agent1 g) (can_move_agent1 h)

    (can_move_agent2 i) (can_move_agent2 j) (can_move_agent2 k) (can_move_agent2 l)
    (can_move_agent2 m) (can_move_agent2 n) (can_move_agent2 o)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h)
    (smaller a i) (smaller a j) (smaller a k) (smaller a l) (smaller a m) (smaller a n) (smaller a o)

    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i)
    (smaller b j) (smaller b k) (smaller b l) (smaller b m) (smaller b n) (smaller b o)

    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller c k) (smaller c l) (smaller c m) (smaller c n) (smaller c o)

    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j) (smaller d k)
    (smaller d l) (smaller d m) (smaller d n) (smaller d o)

    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j) (smaller e k) (smaller e l)
    (smaller e m) (smaller e n) (smaller e o)

    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k) (smaller f l) (smaller f m)
    (smaller f n) (smaller f o)

    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l) (smaller g m) (smaller g n)
    (smaller g o)

    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m) (smaller h n) (smaller h o)

    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n) (smaller i o)

    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o)

    (smaller k l) (smaller k m) (smaller k n) (smaller k o)

    (smaller l m) (smaller l n) (smaller l o)

    (smaller m n) (smaller m o)

    (smaller n o)
  )
  (:goal (and
    (on a right)
    (on b left) (on c left) (on d left) (on e left) (on f left) (on g left)
    (on h left) (on i left) (on j left) (on k left) (on l left) (on m left) (on n left) (on o left)
    (empty middle)
  )))