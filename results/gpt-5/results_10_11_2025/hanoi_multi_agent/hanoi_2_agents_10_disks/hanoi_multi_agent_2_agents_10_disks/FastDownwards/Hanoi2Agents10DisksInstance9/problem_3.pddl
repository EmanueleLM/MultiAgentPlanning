(define (problem hanoi2agents10disksinstance9)
  (:domain hanoi-two-agent-10)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    a b c d e f g h i j - disk
  )
  (:init
    ; initial stack on left: a(top) ... j(bottom)
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

    ; agent capabilities
    (can-move agent_1 a)
    (can-move agent_1 b)
    (can-move agent_1 c)
    (can-move agent_1 d)
    (can-move agent_1 e)
    (can-move agent_2 f)
    (can-move agent_2 g)
    (can-move agent_2 h)
    (can-move agent_2 i)
    (can-move agent_2 j)

    ; size ordering: pegs are larger than all disks
    (larger left a) (larger left b) (larger left c) (larger left d) (larger left e) (larger left f) (larger left g) (larger left h) (larger left i) (larger left j)
    (larger middle a) (larger middle b) (larger middle c) (larger middle d) (larger middle e) (larger middle f) (larger middle g) (larger middle h) (larger middle i) (larger middle j)
    (larger right a) (larger right b) (larger right c) (larger right d) (larger right e) (larger right f) (larger right g) (larger right h) (larger right i) (larger right j)

    ; size ordering among disks (x larger than y if x is physically larger)
    (larger b a)
    (larger c a) (larger c b)
    (larger d a) (larger d b) (larger d c)
    (larger e a) (larger e b) (larger e c) (larger e d)
    (larger f a) (larger f b) (larger f c) (larger f d) (larger f e)
    (larger g a) (larger g b) (larger g c) (larger g d) (larger g e) (larger g f)
    (larger h a) (larger h b) (larger h c) (larger h d) (larger h e) (larger h f) (larger h g)
    (larger i a) (larger i b) (larger i c) (larger i d) (larger i e) (larger i f) (larger i g) (larger i h)
    (larger j a) (larger j b) (larger j c) (larger j d) (larger j e) (larger j f) (larger j g) (larger j h) (larger j i)
  )
  (:goal
    (and
      ; left: c f g h i j (top->bottom)
      (on c f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j left)
      (clear c)

      ; middle: e only
      (on e middle)
      (clear e)

      ; right: a b d (top->bottom)
      (on a b)
      (on b d)
      (on d right)
      (clear a)
    )
  )
)