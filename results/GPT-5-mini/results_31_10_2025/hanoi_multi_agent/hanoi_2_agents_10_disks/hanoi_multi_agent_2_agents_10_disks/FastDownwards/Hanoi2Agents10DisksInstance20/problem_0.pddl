(define (problem hanoi_multi_agent_problem)
  (:domain hanoi_multi_agent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )

  (:init
    ;; initial stack on 'left' top -> bottom: A B C D E F G H I J
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; agent movement permissions (strict constraints)
    (can-move agent_1 A) (can-move agent_1 B) (can-move agent_1 C) (can-move agent_1 D) (can-move agent_1 E)
    (can-move agent_2 F) (can-move agent_2 G) (can-move agent_2 H) (can-move agent_2 I) (can-move agent_2 J)

    ;; size ordering: smaller X Y for all X that are smaller than Y
    ;; A is smallest, J largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )

  (:goal (and
    ;; goal stacks:
    ;; left top->bottom = B, E, F, G, H, I, J
    (on B left)
    (on E B)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; middle top->bottom = A
    (on A middle)

    ;; right top->bottom = C, D
    (on C right)
    (on D C)
  ))
)