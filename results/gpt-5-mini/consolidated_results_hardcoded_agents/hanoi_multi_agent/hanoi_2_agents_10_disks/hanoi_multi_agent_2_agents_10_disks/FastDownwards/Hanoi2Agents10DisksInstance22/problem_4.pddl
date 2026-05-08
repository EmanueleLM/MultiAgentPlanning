(define (problem Hanoi2Agents10DisksInstance22)
  (:domain hanoi-multiagent)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )

  (:init
    ;; initial stack on left: top->bottom A B C D E F G H I J
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg J left)

    ;; clears: top disk and empty pegs
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; agent movement permissions
    (can-move-agent1 A)
    (can-move-agent1 B)
    (can-move-agent1 C)
    (can-move-agent1 D)
    (can-move-agent1 E)

    (can-move-agent2 F)
    (can-move-agent2 G)
    (can-move-agent2 H)
    (can-move-agent2 I)
    (can-move-agent2 J)

    ;; size ordering (smaller X Y means X is smaller than Y)
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
    (on-disk A C)
    (on-disk C E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg J left)
    (on-peg D middle)
    (on-peg B right)
  )))